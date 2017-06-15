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
    public partial class TraCuuDaiLy : Form
    {
        public TraCuuDaiLy()
        {
            InitializeComponent();
        }

        public void LoadData()
        {
            SqlConnection ketnoi = new SqlConnection();
            ketnoi.ConnectionString = @"Data Source=TNC-PC\SQLEXPRESS;Initial Catalog=tranguyen;Integrated Security=True";
            ketnoi.Open();
            SqlCommand command = new SqlCommand("LietKeDaiLy", ketnoi);
            command.CommandType = CommandType.StoredProcedure;
            command.ExecuteNonQuery();
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = command;
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            dataGridView1.DataSource = dt;
            ketnoi.Close();
        }

        private void TraCuuDaiLy_Load(object sender, EventArgs e)
        {


            dataGridView1.AutoGenerateColumns = false;
            dataGridView1.Columns[0].DataPropertyName = "MaDaiLy";
            dataGridView1.Columns[1].DataPropertyName = "TenDaiLy";
            dataGridView1.Columns[2].DataPropertyName = "MaLoaiDaiLy";
            dataGridView1.Columns[3].DataPropertyName = "DienThoai";
            dataGridView1.Columns[4].DataPropertyName = "DiaChi";
            dataGridView1.Columns[5].DataPropertyName = "MaQuan";
            dataGridView1.Columns[6].DataPropertyName = "NgayTiepNhan";
            dataGridView1.Columns[7].DataPropertyName = "Email";
            dataGridView1.Columns[8].DataPropertyName = "TienNo";

            dataGridView1.Columns[0].HeaderText = "Mã Đại Lý";
            dataGridView1.Columns[1].HeaderText = "Tên Đại Lý";
            dataGridView1.Columns[2].HeaderText = "Mã Loại Đại Lý";
            dataGridView1.Columns[3].HeaderText = "Điện Thoại";
            dataGridView1.Columns[4].HeaderText = "Địa Chỉ";
            dataGridView1.Columns[5].HeaderText = "Mã Quận";
            dataGridView1.Columns[6].HeaderText = "Ngày Tiếp Nhận";
            dataGridView1.Columns[7].HeaderText = "Email";
            dataGridView1.Columns[8].HeaderText = "Tiền Nợ";

            LoadData();









        }


        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
