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
    public partial class Form1 : Form
    {
        public Form1()
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



        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void navegador1_Load(object sender, EventArgs e)
        {
            NavegadorVista.Navegador.idApp = "6002";
            TextBox[] Grupotextbox = { TxtCodigo, TxtNombre, TxtApellido, TxtEstado };
            TextBox[] Idtextbox = { TxtCodigo, TxtNombre, TxtApellido, TxtEstado };
            navegador1.textbox = Grupotextbox;
            navegador1.tabla = dataGridView1;
            navegador1.textboxi = Idtextbox;
            navegador1.actual = this;
            navegador1.cargar(dataGridView1, Grupotextbox, "hotel_EF");
        }

        private void TxtCodigo_TextChanged(object sender, EventArgs e)
        {
            txtcheck();
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            checkbox();
        }

        private void TxtEstado_TextChanged(object sender, EventArgs e)
        {
            txtcheck();
        }
    }
}
