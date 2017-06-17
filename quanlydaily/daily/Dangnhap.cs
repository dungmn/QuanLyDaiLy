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
    public partial class Dangnhap : Form
    {
        public Dangnhap()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            DataTable temp = DataProvider.Instance.ExecuteQuery("USP_CHECKACCOUNT @ID , @pass", new object[] { txtId.Text, txtPass.Text });
            if(temp.Rows.Count > 0)
            {
                MessageBox.Show("Đăng nhập thành công");
                Home h = new Home();
                
                h.Show();
                this.Hide();

            }
            else
            {
                MessageBox.Show("Tên tài khoản hoăc mật khẩu không đúng");
            }
        }
    }
}
