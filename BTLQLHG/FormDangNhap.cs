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
    public partial class FormDangNhap : Form
    {
        const int WM_NCHITTEST = 0x84;
        const int HTCLIENT = 0x1;
        const int HTCAPTION = 0x2;
        public FormDangNhap()
        {
            InitializeComponent();
        }
        protected override void WndProc(ref Message message)
        {
            base.WndProc(ref message);

            if (message.Msg == WM_NCHITTEST && (int)message.Result == HTCLIENT)
                message.Result = (IntPtr)HTCAPTION;
        }
        private void BtnDN_Click_1(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-4DSUGHA;Initial Catalog=QLHG;Integrated Security=True");
            con.Open();
            string tk = TxtTK.Text;
            string mk = TxtMK.Text;
            string sql = "SELECT * FROM TaiKhoan Where TaiKhoan = '" + tk + "' and MatKhau ='" + mk + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataAdapter da = new SqlDataAdapter(sql,con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            SqlDataReader data = cmd.ExecuteReader();
            
            if (dt.Rows.Count>0 && data.Read() == true)
            {
                HomeForm but = new HomeForm(dt.Rows[0][0].ToString(), dt.Rows[0][1].ToString(), dt.Rows[0][2].ToString(), dt.Rows[0][3].ToString());
                but.FormClosed += new FormClosedEventHandler(FormDangNhap_Load);
                but.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Sai tài khoản/mật khẩu" + "\nMời bạn nhập lại!!");
            }
        
        }
        private void FormDangNhap_Load(object sender, EventArgs e)
        {
            this.Show();
        }

        private void BtnThoat_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
