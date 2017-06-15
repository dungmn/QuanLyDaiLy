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
    public partial class SuaDaiLy : Form
    {
        public SuaDaiLy()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SqlConnection ketnoi = new SqlConnection();
            ketnoi.ConnectionString = @"Data Source=TNC-PC\SQLEXPRESS;Initial Catalog=tranguyen;Integrated Security=True";
            ketnoi.Open();
            SqlCommand command = new SqlCommand("SuaDaiLy", ketnoi);
            command.CommandType = CommandType.StoredProcedure;


            SqlParameter p = new SqlParameter("@MaDaiLy", txtMaDaiLy.Text);
            command.Parameters.Add(p);
            p = new SqlParameter("@TenDaiLy", txtTenDaiLy.Text);
            command.Parameters.Add(p);
            p = new SqlParameter("@MaLoaiDaiLy", txtMaLoaiDaiLy.Text);
            command.Parameters.Add(p);
            p = new SqlParameter("@DienThoai", txtDienThoai.Text);
            command.Parameters.Add(p);
            p = new SqlParameter("@DiaChi", txtDiaChi.Text);
            command.Parameters.Add(p);
            p = new SqlParameter("@MaQuan", txtMaQuan.Text);
            command.Parameters.Add(p);
            p = new SqlParameter("@NgayTiepNhan", txtNgayTiepNhan.Text);
            command.Parameters.Add(p);
            p = new SqlParameter("@Email", txtEmail.Text);
            command.Parameters.Add(p);
            p = new SqlParameter("@TienNo", txtTienNo.Text);
            command.Parameters.Add(p);

            int count = command.ExecuteNonQuery();

            if (count > 0)
            {
                MessageBox.Show("Sua thanh cong");
               
            }
            ketnoi.Close();
        }
    }
}
