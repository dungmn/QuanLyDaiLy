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
    public partial class TuyChinhDuLieu : Form
    {
        public TuyChinhDuLieu()
        {
            InitializeComponent();
        }

        private void label10_Click(object sender, EventArgs e)
        {

        }

        private void txtMaDaiLy_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnSoDaiLy_Click(object sender, EventArgs e)
        {
            int temp = DataProvider.Instance.ExecuteNonQuery("USP_SUA_SLDL @SL , @MaQuan", new object[] { txtSoDaiLy.Text, txtMaQuan.Text });
            if (temp > 0)
            {
                MessageBox.Show("Thay đổi thành công số đại lý tối đa của quận " + txtMaQuan.Text);
            }
            else
            {
                MessageBox.Show("Thay đổi thất bại!");
            }
        }

        private void btnSLMH_Click(object sender, EventArgs e)
        {
            int temp = DataProvider.Instance.ExecuteNonQuery("USP_SUA_SLMATHANG @SL", new object[] { txtSLMH.Text });
            if (temp > 0)
            {
                MessageBox.Show("Thay đổi thành công số mặt hàng tối đa  ");
            }
            else
            {
                MessageBox.Show("Thay đổi thất bại!");
            }
        }

        private void btnSLDVT_Click(object sender, EventArgs e)
        {
            int temp = DataProvider.Instance.ExecuteNonQuery("USP_SUA_SLDVT @SL", new object[] { txtSLDVT.Text });
            if (temp > 0)
            {
                MessageBox.Show("Thay đổi thành công sô loại đơn vị tính tối đa  ");
            }
            else
            {
                MessageBox.Show("Thay đổi thất bại!");
            }
        }

        private void btnSLDL_Click(object sender, EventArgs e)
        {
            int temp = DataProvider.Instance.ExecuteNonQuery("USP_SUA_SOLOAIDAILY @SL", new object[] { txtSLDL.Text });
            if (temp > 0)
            {
                MessageBox.Show("Thay đổi thành công sô loại đại lý tối đa  ");
            }
            else
            {
                MessageBox.Show("Thay đổi thất bại!");
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void TuyChinhDuLieu_Load(object sender, EventArgs e)
        {

        }
    }
}
