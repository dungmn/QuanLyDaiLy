using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
namespace daily
{
    public partial class XoaDaiLy : Form
    {
        public XoaDaiLy()
        {
            InitializeComponent();
        }

        private void label10_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection ketnoi = new SqlConnection();
            ketnoi.ConnectionString = @"Data Source=TNC-PC\SQLEXPRESS;Initial Catalog=tranguyen;Integrated Security=True";
            ketnoi.Open();
            SqlCommand command = new SqlCommand("XoaDaiLy", ketnoi);
            command.CommandType = CommandType.StoredProcedure;


            SqlParameter p = new SqlParameter("@MaDaiLy", txtMaDaiLy.Text);
            command.Parameters.Add(p);
            int count = command.ExecuteNonQuery();

            if (count > 0)
            {
                MessageBox.Show("Xoa thanh cong");
              
            }
            ketnoi.Close();
        }

        private void panel3_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
