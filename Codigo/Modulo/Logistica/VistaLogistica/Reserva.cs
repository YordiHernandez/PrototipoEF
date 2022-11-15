using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ControladorLogistica;

namespace VistaLogistica
{
    public partial class Reserva : Form
    {
        Controlador cn = new Controlador();
        public Reserva()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void navegador1_Load(object sender, EventArgs e)
        {
            NavegadorVista.Navegador.idApp = "6003";
            TextBox[] Grupotextbox = { TxtCodigo, TxtCliente, TxtHabitacion, TxtFEN, TxtFSA, TxtCanti };
            TextBox[] Idtextbox = { TxtCodigo, TxtCliente, TxtHabitacion, TxtFEN, TxtFSA, TxtCanti };
            navegador1.textbox = Grupotextbox;
            navegador1.tabla = dataGridView1;
            navegador1.textboxi = Idtextbox;
            navegador1.actual = this;
            navegador1.cargar(dataGridView1, Grupotextbox, "hotel_EF");
        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            TxtCliente.Text = dataGridView2.CurrentRow.Cells[0].Value.ToString();
        }

        private void dataGridView3_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            TxtHabitacion.Text = dataGridView3.CurrentRow.Cells[0].Value.ToString();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            cn.llenartablaa(dataGridView2.Tag.ToString(), dataGridView2);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            cn.llenartablaa(dataGridView3.Tag.ToString(), dataGridView3);
        }
    }
    }

