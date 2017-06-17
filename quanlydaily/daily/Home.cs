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
            dl.ShowDialog();
        }

       
       

        

        private void button7_Click(object sender, EventArgs e)
        {
            Xuathang  dl = new Xuathang();
            dl.ShowDialog();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Thutien dl = new Thutien();
            dl.ShowDialog();
     
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Doanhso dl = new Doanhso();
            dl.ShowDialog();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Congno  dl = new Congno();
            dl.ShowDialog();
        }

        private void button14_Click(object sender, EventArgs e)
        {
            TuyChinhDuLieu  dl = new TuyChinhDuLieu ();
            dl.Show();
        }

        private void Home_Load(object sender, EventArgs e)
        {

        }
    }
}
