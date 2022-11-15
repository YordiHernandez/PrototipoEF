using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace VistaLogistica
{
    public partial class habitacion : Form
    {
        public habitacion()
        {
            InitializeComponent();
        }

        public void checkbox()
        {
            if (checkBox1.Checked)
            {
                TxtEstado.Text = "1";
            }
            else
            {
                TxtEstado.Text = "0";
            }
        }

        public void txtcheck()
        {
            if (TxtEstado.Text == "1")
            {
                checkBox1.Checked = true;
            }
            else
            {
                checkBox1.Checked = false;
            }
        }



        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void navegador1_Load(object sender, EventArgs e)
        {

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            checkbox();
        }

        private void txtact_TextChanged(object sender, EventArgs e)
        {
            txtcheck();
        }



    }
}
