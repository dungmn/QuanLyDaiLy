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
    public partial class Daily : Form
    {
        public Daily()
        {
            InitializeComponent();
        }  

       

        private void label7_Click(object sender, EventArgs e)
        {

        }

       

        private void label9_Click(object sender, EventArgs e)
        {

        }

        

        
        public void LoadData()
        {
            
            DataTable dt = new DataTable();
            dt = DataProvider.Instance.ExecuteQuery("select * from DaiLy");
            dataGridView1.DataSource = dt;
         
        }

        private void Daily_Load(object sender, EventArgs e)
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
       

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0 && e.ColumnIndex >= 0)
            {
                txtMaDaiLy.Text = Convert.ToString(dataGridView1.CurrentRow.Cells[0].Value);
                txtTenDaiLy.Text = Convert.ToString(dataGridView1.CurrentRow.Cells[1].Value);
                txtMaLoaiDaiLy.Text = Convert.ToString(dataGridView1.CurrentRow.Cells[2].Value);
                txtDienThoai.Text = Convert.ToString(dataGridView1.CurrentRow.Cells[3].Value);
                txtDiaChi.Text = Convert.ToString(dataGridView1.CurrentRow.Cells[4].Value);
                txtMaQuan.Text = Convert.ToString(dataGridView1.CurrentRow.Cells[5].Value);
                txtNgayTiepNhan.Text = Convert.ToString(dataGridView1.CurrentRow.Cells[6].Value);
                txtEmail.Text = Convert.ToString(dataGridView1.CurrentRow.Cells[7].Value);
                txtTienNo.Text = Convert.ToString(dataGridView1.CurrentRow.Cells[8].Value);

               
            }
        }




       

        private void button2_Click(object sender, EventArgs e)
        {
            string key = "%" + txtSearch.Text + "%";
            DataTable dt = new DataTable();
            dt = DataProvider.Instance.ExecuteQuery("USP_SEARCH @KEY", new object[] {key });
            dataGridView1.DataSource = dt;
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            int temp = DataProvider.Instance.ExecuteNonQuery("ThemDaiLy @MaDaiLy , @TenDaiLy , @MaLoaiDaiLy , @DienThoai , @DiaChi , @MaQuan , @NgayTiepNhan , @Email , @TienNo",new object[] {txtMaDaiLy.Text,txtTenDaiLy.Text, txtMaLoaiDaiLy.Text,txtDienThoai.Text, txtDiaChi.Text, txtMaQuan.Text,txtNgayTiepNhan.Text, txtEmail.Text,txtTienNo.Text });
            if (temp > 0)
            {
                MessageBox.Show("Thêm vào một đại lý thành công.");
                LoadData();
            }
            else
            {
                MessageBox.Show("Thêm thất bại.(Có thể đã trùng mã đại lý)");
            }
        }

        private void button3_Click_1(object sender, EventArgs e)
        {
            int temp = DataProvider.Instance.ExecuteNonQuery("USP_XOADAILY @MaDaiLy", new object[] { txtMaDaiLy.Text });
            if (temp > 0)
            {
                MessageBox.Show("Xóa đại lý thành công.");
                LoadData();
            }
            else
            {
                MessageBox.Show("Xóa thất bại");
            }
        }

        private void button4_Click_1(object sender, EventArgs e)
        {
            int temp = DataProvider.Instance.ExecuteNonQuery("USP_SUADAILY @MaDaiLy , @TenDaiLy , @MaLoaiDaiLy , @DienThoai , @DiaChi , @MaQuan , @NgayTiepNhan , @Email , @TienNo", new object[] { txtMaDaiLy.Text, txtTenDaiLy.Text, txtMaLoaiDaiLy.Text, txtDienThoai.Text, txtDiaChi.Text, txtMaQuan.Text, txtNgayTiepNhan.Text, txtEmail.Text, txtTienNo.Text });
            if (temp > 0)
            {
                MessageBox.Show("Sửa đại lý thành công.");
                LoadData();
            }
            else
            {
                MessageBox.Show("Sửa thất bại");
            }
        }
    }
}
