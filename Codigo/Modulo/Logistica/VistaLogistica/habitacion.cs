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
            NavegadorVista.Navegador.idApp = "6001";
            TextBox[] Grupotextbox = { TxtCodigo, TxtTipo, TxtNumero, TxtEstado };
            TextBox[] Idtextbox = { TxtCodigo, TxtTipo, TxtNumero, TxtEstado };
            navegador1.textbox = Grupotextbox;
            navegador1.tabla = dataGridView1;
            navegador1.textboxi = Idtextbox;
            navegador1.actual = this;
            navegador1.cargar(dataGridView1, Grupotextbox, "hotel_EF");
        }

       
        private void checkBox1_CheckedChanged_1(object sender, EventArgs e)
        {
            checkbox();
        }
    }
}
