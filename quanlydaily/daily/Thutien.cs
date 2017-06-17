using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace daily
{
    public partial class Thutien : Form
    {
        public Thutien()
        {
            InitializeComponent();
        }

        private void textBox8_TabIndexChanged(object sender, EventArgs e)
        {
           
        }

        private void txtMaDaiLy_TextChanged(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            string key = "1";
            if (txtMaDaiLy.Text != "") key = txtMaDaiLy.Text;
            string query = "Select top 1 * from DaiLy where MaDaiLy='" + key + "'";
            dt = DataProvider.Instance.ExecuteQuery(query);
            if (dt.Rows.Count > 0)
            {
                txtTenDaiLy.Text = dt.Rows[0][1].ToString();
                txtEmail.Text = dt.Rows[0][7].ToString();
                txtDienThoai.Text = dt.Rows[0][3].ToString();
                txtDiaChi.Text = dt.Rows[0][4].ToString();


            }
            else
            {
                txtTenDaiLy.Text = "";
                txtEmail.Text = "";
                txtDienThoai.Text = "";
                txtDiaChi.Text = "";
            }
            

        }

        private void txtMaDaiLy_Leave(object sender, EventArgs e)
        {
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
        }

        private void Thutien_Load(object sender, EventArgs e)
        {

        }

        private void btnLapPhieu_Click(object sender, EventArgs e)
        {
            int temp = DataProvider.Instance.ExecuteNonQuery("USP_THEM_PHIEUTHU @MaPhieuThu , @MaDaiLy , @NgayThu , @SoTien",new object[] {txtMaPhieuThu.Text,txtMaDaiLy.Text,txtNgayThu.Text,txtSoTien.Text });
            if (temp > 0)
            {
                MessageBox.Show("Thêm phiếu thu thành công");
            }
            else
            {
                MessageBox.Show("Thêm thất bại");
            }
        }
    }
}
