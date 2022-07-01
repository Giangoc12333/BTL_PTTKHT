using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace BTLQLHG
{
    public partial class FormTaiKhoan : Form
    {
        SqlConnection connection;
        SqlCommand command;
        string str = @"Data Source=DESKTOP-4DSUGHA;Initial Catalog=QLHG;Integrated Security=True";
        SqlDataAdapter adapter = new SqlDataAdapter();
        DataTable table = new DataTable();
       
        private void LoadData()
        {
            command = connection.CreateCommand();
            command.CommandText = "Select *from TaiKhoan";
            adapter.SelectCommand = command;
            table.Clear();
            adapter.Fill(table);
            dgvtaikhoan.DataSource = table;
        }
        public FormTaiKhoan()
        {
            InitializeComponent();
        }

        private void FormTaiKhoan_Load(object sender, EventArgs e)
        {
            connection = new SqlConnection(str);
            connection.Open();
            LoadComboBoxTenNV();
            LoadData();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                command = connection.CreateCommand();
                command.CommandText = "Insert Into TaiKhoan " +
                    "Values('"+txtTaiK.Text+"','"+txtMatK.Text+ "',N'"+cbbTenNV.SelectedValue+"','"+cbbPhanQ.Text+"')";
                command.ExecuteNonQuery();
                LoadData();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Có lỗi khi load dữ liệu!\n", ex.ToString());
            }

        }
        private void dgvtaikhoan_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowindex = dgvtaikhoan.CurrentCell.RowIndex;
            txtTaiK.Text = dgvtaikhoan.Rows[rowindex].Cells[0].Value.ToString();
            txtMatK.Text = dgvtaikhoan.Rows[rowindex].Cells[1].Value.ToString();
            cbbTenNV.SelectedValue = dgvtaikhoan.Rows[rowindex].Cells[2].Value.ToString();
            cbbPhanQ.Text = dgvtaikhoan.Rows[rowindex].Cells[3].Value.ToString();
        }
        public void LoadComboBoxTenNV()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter("Select  TenNV From NHANVIEN", connection);
                da.Fill(dt);
                cbbTenNV.DataSource = dt;
                cbbTenNV.DisplayMember = "TenNV";
                cbbTenNV.ValueMember = "TenNV";
                cbbTenNV.DataSource = dt;

            }
            catch (Exception ex)
            {
                MessageBox.Show("Có lỗi khi load dữ liệu!\n", ex.ToString());
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                command = connection.CreateCommand();
                command.CommandText = "delete from Taikhoan Where TaiKhoan = '" + txtTaiK.Text + "'";
                command.ExecuteNonQuery();
                LoadData();
                MessageBox.Show("Bạn đã xoá dữ liệu thành công!");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Có lỗi khi load dữ liệu!\n", ex.ToString());
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                command = connection.CreateCommand();
                command.CommandText = "Update TaiKhoan Set MatKhau='"+txtMatK.Text+"',TenNV =N'"+cbbTenNV.Text +"',PhanQuyen ='"+cbbPhanQ.Text +"' where TaiKhoan ='"+txtTaiK.Text+"'";
                command.ExecuteNonQuery();
                LoadData();
                MessageBox.Show("Bạn đã sửa dữ liệu thành công!");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Có lỗi khi load dữ liệu!\n", ex.ToString());
            }
        }

        private void btnKhoiTao_Click(object sender, EventArgs e)
        {
            txtMatK.Text = "";
            txtTaiK.Text = "";
            cbbTenNV.SelectedValue = "";
            cbbPhanQ.Text = "";
            LoadData();
            MessageBox.Show("Bạn đã khởi tạo dữ liệu thành công!");
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
