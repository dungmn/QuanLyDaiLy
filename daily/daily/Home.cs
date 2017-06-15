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
    public partial class Home : Form
    {
        public Home()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Daily  dl = new Daily ();
            dl.Show();
        }

        private void button10_Click(object sender, EventArgs e)
        {
            TiepNhanDaiLy dl = new TiepNhanDaiLy();
            dl.Show();
        }

        private void button9_Click(object sender, EventArgs e)
        {

           XoaDaiLy dl = new XoaDaiLy();
            dl.Show();
        }

        private void button8_Click(object sender, EventArgs e)
        {

            SuaDaiLy dl = new SuaDaiLy();
            dl.Show();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            Xuathang  dl = new Xuathang();
            dl.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            PhieuThuTien  dl = new PhieuThuTien ();
            dl.Show();
     
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Doanhso dl = new Doanhso();
            dl.Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Congno  dl = new Congno();
            dl.Show();
        }

        private void button14_Click(object sender, EventArgs e)
        {
            TuyChinhDuLieu  dl = new TuyChinhDuLieu ();
            dl.Show();
        }
    }
}
