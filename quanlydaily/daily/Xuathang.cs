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
    public partial class Xuathang : Form
    {
        public Xuathang()
        {
            InitializeComponent();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            //Nhap Phieu xuat
            int temp = DataProvider.Instance.ExecuteNonQuery("USP_NHAPPHIEUXUAT @MaPX , @MaDaiLy , @NgayLapPhieu", new object[] { txtMaPX.Text, txtMaDL.Text, txtNgayLap.Text });
            //Nhap CTPX
            int temp2 = DataProvider.Instance.ExecuteNonQuery("USP_NHAPCTPX @MaCTX , @MaPX , @MaMatHang , @DVT , @SL , @DonGia", new object[] {txtMaCTPX.Text, txtMaPX.Text, txtMaMatHang.Text, txtMaDonViTinh.Text, txtSoLuong.Text , txtDonGia.Text });
            if (temp2 > 0)
            {
                MessageBox.Show("Thêm món hàng thành công");
                Data2Load();
            }
            else
            {
                MessageBox.Show("Thêm thất bại!");
            }
        }
        private void  Data2Load()
        {
            DataTable dt2 = new DataTable();
            string mapx = "1";
            if (txtMaPX.Text != "") mapx = txtMaPX.Text;
            string query = "select * from ChiTietPhieuXuat where MaPhieuXuat= '" + mapx+"'";
            dt2 = DataProvider.Instance.ExecuteQuery(query);
            dataGridView2.DataSource = dt2;
        }
        private void Xuathang_Load(object sender, EventArgs e)
        {
            dataGridView1.AutoGenerateColumns = false;
            dataGridView1.Columns[0].DataPropertyName = "MaMatHang";
            dataGridView1.Columns[1].DataPropertyName = "TenMatHang";
            dataGridView1.Columns[2].DataPropertyName = "DonViTinh";
            dataGridView1.Columns[3].DataPropertyName = "SoLuongTon";

            dataGridView1.Columns[0].HeaderText = "Mã mặt hàng";
            dataGridView1.Columns[1].HeaderText = "Tên Mặt hàng";
            dataGridView1.Columns[2].HeaderText = "Đơn vị tính";
            dataGridView1.Columns[3].HeaderText = "Số lượng tồn";

            //Data ctpx
            dataGridView2.AutoGenerateColumns = false;
            dataGridView2.Columns[0].DataPropertyName = "MaChiTietPhieuXuat";
            dataGridView2.Columns[1].DataPropertyName = "MaPhieuXuat";
            dataGridView2.Columns[2].DataPropertyName = "MaMatHang";
            dataGridView2.Columns[3].DataPropertyName = "DonViTinh";
            dataGridView2.Columns[4].DataPropertyName = "SoLuongXuat";
            dataGridView2.Columns[5].DataPropertyName = "DonGia";
            dataGridView2.Columns[6].DataPropertyName = "ThanhTien";

            dataGridView2.Columns[0].HeaderText = "Mã CTPX";
            dataGridView2.Columns[1].HeaderText = "Mã Phiếu xuất";
            dataGridView2.Columns[2].HeaderText = "Mã mặt hàng";
            dataGridView2.Columns[3].HeaderText = "Đơn vị tính";
            dataGridView2.Columns[4].HeaderText = "Số Lượng";
            dataGridView2.Columns[5].HeaderText = "Đơn giá";
            dataGridView2.Columns[6].HeaderText = "Thành tiền";
            LoadData();
        }
        private void LoadData()
        {
            DataTable dt1 = new DataTable();
            dt1 = DataProvider.Instance.ExecuteQuery("USP_MATHANG");
            dataGridView1.DataSource = dt1;
            Data2Load();

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if(e.RowIndex >= 0 && e.ColumnIndex >= 0)
            {
               txtMaMatHang.Text = Convert.ToString(dataGridView1.CurrentRow.Cells[0].Value);
                txtTenMatHang.Text = Convert.ToString(dataGridView1.CurrentRow.Cells[1].Value);
                txtMaDonViTinh.Text = Convert.ToString(dataGridView1.CurrentRow.Cells[2].Value);
               
            }
        }

        private void dataGridView2_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if(e.RowIndex>=0 && e.ColumnIndex >= 0)
            {
                txtMaCTPX.Text = Convert.ToString(dataGridView2.CurrentRow.Cells[0].Value);
                txtSoLuong.Text = Convert.ToString(dataGridView2.CurrentRow.Cells[4].Value);
                txtDonGia.Text = Convert.ToString(dataGridView2.CurrentRow.Cells[5].Value);
                txtThanhTien.Text = Convert.ToString(dataGridView2.CurrentRow.Cells[6].Value);
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            int temp = DataProvider.Instance.ExecuteNonQuery("USP_SUA_CTPX @MaCTPX , @SL , @DonGia", new object[] { txtMaCTPX.Text, txtSoLuong.Text, txtDonGia.Text });
            if (temp > 0)
            {
                MessageBox.Show("Sửa chi tiêt phiếu xuất thành công");
                Data2Load();
            }
            else
            {
                MessageBox.Show("Sửa thất bại!");
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            int temp = DataProvider.Instance.ExecuteNonQuery("USP_XOA_CTPX @MaCTPX", new object[] { txtMaCTPX.Text});
            if (temp > 0)
            {
                MessageBox.Show("Xóa chi tiêt phiếu xuất thành công");
                Data2Load();
            }
            else
            {
                MessageBox.Show("Xóa thất bại!");
            }
        }
    }
}
