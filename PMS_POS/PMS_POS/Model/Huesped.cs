﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Data;
using System.Windows.Forms;
using System.Configuration;
using PMS_POS.Controller;


namespace PMS_POS.Model
{
    class Huesped : HuespedD
    {
        string instruccion;

        public int IdHuesped { get; set; }
        public string PrimerNombre { get; set; }
        public string SegundoNombre { get; set; }
        public string PrimerApellido { get; set; }
        public string SegundoApellido { get; set; }
        public string Compania { get; set; }
        public string NombreCompania { get; set; }
        public string TipoDocumento { get; set; }
        public string NumDocumento { get; set; }
        public string Sexo { get; set; }
        public string Telefono { get; set; }
        public string Direccion { get; set; }
        public string Ciudad { get; set; }
        public string Provincia { get; set; }
        public string Pais { get; set; }
        public string Correo { get; set; }
        public string IsDeleted { get; set; }
        public string DeletedDate { get; set; }

        public Huesped() { }

        public Huesped(int pIdHuesped, string pPrimerNombre, string pSegundoNombre, string pPrimerApellido,
            string pSegundoApellido, string pCompania, string pNombreCompania, string pTipoDocumento, string pNumDocumento,
            string pSexo, string pTelefono, string pDireccion, string pCiudad, string pProvincia, string pPais, string pCorreo, string pIsDeleted, string pDeletedDate)

        {
            this.IdHuesped = pIdHuesped;
            this.PrimerNombre = pPrimerNombre;
            this.SegundoNombre = pSegundoNombre;
            this.PrimerApellido = pPrimerApellido;
            this.SegundoApellido = pSegundoApellido;
            this.Compania = pCompania;
            this.NombreCompania = pNombreCompania;
            this.TipoDocumento = pTipoDocumento;
            this.NumDocumento = pNumDocumento;
            this.Sexo = pSexo;
            this.Telefono = pTelefono;
            this.Direccion = pDireccion;
            this.Ciudad = pCiudad;
            this.Provincia = pProvincia;
            this.Pais = pPais;
            this.Correo = pCorreo;
            this.IsDeleted = pIsDeleted;
            this.DeletedDate = pDeletedDate;

        }

        public DataTable VistaTabla()
        {
            instruccion = "Select IdHuesped, PrimerNombre, SegundoNombre, PrimerApellido, NumDocumento, TipoDocumento, Telefono, Correo, Pais FROM huesped WHERE IsDeleted = 0";
            MySqlDataAdapter adp = new MySqlDataAdapter(instruccion, conexion());
            DataTable COnsulta = new DataTable();
            adp.Fill(COnsulta);
            return COnsulta;
        }

        public void BorrarCampos(Control control, GroupBox gb)
        {
            foreach (var txt in control.Controls)
            {
                if (txt is TextBox)
                {
                    ((TextBox)txt).Clear();
                }
                else if (txt is ComboBox)
                {
                    ((ComboBox)txt).SelectedIndex = 0;
                }
                foreach (var combo in gb.Controls)
                {
                    if (combo is TextBox)
                    {
                        ((TextBox)combo).Clear();
                    }
                    else if (combo is ComboBox)
                    {
                        ((ComboBox)combo).SelectedIndex = 0;
                    }
                }
            }
        }
        static string connString = ConfigurationManager.ConnectionStrings["cString"].ConnectionString;
        public DataTable Search(string s)
        {
            //hacer la conexion con sql
            MySqlConnection conn = new MySqlConnection(connString);
            DataTable dt = new DataTable();
            try
            {
                //Select query
                string sql = "SELECT * FROM huesped WHERE IsDeleted=0 AND PrimerNombre like '%" + s + "%' OR SegundoNombre like '%" + s + "%' OR PrimerApellido like '%" + s + "%' OR SegundoApellido like '%" + s + "%' OR NombreCompañia like '%" + s + "%'";
                // creating cmd using sql and conn
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                //Creating data adapter
                MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                conn.Open();
                adapter.Fill(dt);
            }
            catch (Exception ex)
            {

            }
            finally
            {
                conn.Close();
            }
            return dt;
        }

        public bool Delete(Huesped p)
        {
            //Create Sql Connection
            using (MySqlConnection mySqlConn = new MySqlConnection(connString))
            {
                //Sql to delete
                string sql = "UPDATE huesped SET IsDeleted=@IsDeleted WHERE IdHuesped=@IdHuesped";

                //Creating SQL Command
                MySqlCommand cmd = new MySqlCommand(sql, mySqlConn);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@IdHuesped", p.IdHuesped);
                cmd.Parameters.AddWithValue("@IsDeleted", 1);
                //Open Connection
                mySqlConn.Open();
                int row = cmd.ExecuteNonQuery();
                mySqlConn.Close();
                if (row > 0)
                {

                    return true;
                }
                else
                {

                    return false;
                }
            }
        }
        public DataTable GetHuesped(int idHuesped)
        {
            //hacer la conexion con sql
            MySqlConnection conn = new MySqlConnection(connString);
            DataTable dt = new DataTable();
            try
            {
                //Select query
                string sql = "SELECT * FROM huesped where IdHuesped = @IdHuesped ";
                // creating cmd using sql and conn
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@IdHuesped", idHuesped);
                //Creating data adapter
                MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                conn.Open();
                adapter.Fill(dt);
            }
            catch (Exception ex)
            {

            }
            finally
            {
                conn.Close();
            }
            return dt;
        }
    }
}