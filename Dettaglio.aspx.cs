using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce_Epicode_Buildweek
{
    public partial class Dettaglio : System.Web.UI.Page
    {
        private string ProductId;
        private static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["product"] == null)
            {
                Response.Redirect("HomePage.aspx");
            }
            else
            {
                ProductId = Request.QueryString["product"].ToString();
                try
                {
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        conn.Open();
                        SqlCommand cmd = new SqlCommand($"SELECT * FROM Prodotto WHERE idprodotto={ProductId}", conn);
                        SqlDataReader dataReader = cmd.ExecuteReader();
                        if (dataReader.HasRows)
                        {
                            dataReader.Read();
                            ttlProdotto.InnerText = dataReader["Nome"].ToString();
                            img.Src = dataReader["Immagine"].ToString();
                            txtDescrizione.InnerText = dataReader["Descrizione"].ToString();
                            txtDettagli.InnerText = dataReader["Dettagli"].ToString();
                            txtPrezzo.InnerText = dataReader["Prezzo"].ToString() + "€";
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            }
        }

        protected void btnAcquista_Click(object sender, EventArgs e)
        {
            int prodId = int.Parse(ProductId);
            int quantity = int.Parse(QuantitaTextBox.Text);
            HomePage.products.Add(new Quantity(prodId, quantity));
            Session["ProductID"] = HomePage.products;
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", "<script>alert('Prodotti aggiunti');</script>");
            QuantitaTextBox.Text = "1";
        }

        protected void decrement(object sender, EventArgs e)
        {
            int quantity = int.Parse(QuantitaTextBox.Text);
            if (quantity > 1)
            {
                QuantitaTextBox.Text = (quantity - 1).ToString();
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Alert", "<script>alert('Impossibile aggiungere 0 prodotti');</script>");
            }
        }

        protected void increment(object sender, EventArgs e)
        {
            QuantitaTextBox.Text = (int.Parse(QuantitaTextBox.Text) + 1).ToString();
        }
    }
}