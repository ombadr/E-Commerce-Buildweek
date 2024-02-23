using E_Commerce_Epicode_Buildweek;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BuildWeekMattia
{
    public partial class Cart : System.Web.UI.Page
    {
        static string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
        SqlConnection conn = new SqlConnection(connectionString);
        List<Articolo> carrello = new List<Articolo>();

        protected void Page_Load(object sender, EventArgs e)
        {
            int totcarrello = 0;
            foreach (Quantity prodotti in HomePage.products)
            {
                conn.Open();
                SqlCommand cmd2 = new SqlCommand($"SELECT * FROM Prodotto WHERE idprodotto={prodotti.Id}", conn);
                SqlDataReader reader = cmd2.ExecuteReader();

                while (reader.Read())
                {
                    Articolo articolo = new Articolo(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetInt32(3), reader.GetString(4), reader.GetString(5));

                    carrello.Add(articolo);
                    int totale = articolo.Prezzo * prodotti.Quant;
                    totcarrello += totale;
                    Button btnRemove = new Button
                    {
                        CssClass = "btnGlowLab",
                        Text = "Rimuovi",
                        CommandArgument = articolo.Id.ToString()
                    };
                    btnRemove.Click += RemoveFromCart;

               
                    LiteralControl lc = new LiteralControl(
                        $@"<div class=""row"">
                    <div class=""d-flex justify-content-evenly"">
                        <div class=""col-4 imgCard"">
                            <img style=""width: 160px; height: 180px;"" src=""{articolo.Immagine}"" />
                        </div>
                        <div class=""col-5"">
                            <label class=""form-control"">{articolo.Nome}</label>
                            <label class=""form-control"">Prezzo unitario: {articolo.Prezzo}&euro;</label>
                            <label class=""form-control"">Quantità:{prodotti.Quant}</label>
                            <label class=""form-control"">Prezzo Tot:{totale}&euro;</label>
                        </div>
                         
                        
                    </div>
                </div>");
                    
                    Panel1.Controls.Add(btnRemove);
                    Panel1.Controls.Add(lc);
                   
                }
                conn.Close();
            }

          
            LiteralControl totalCart = new LiteralControl($"<div><p>Totale Carrello:{totcarrello}</p></div>");
            Panel1.Controls.Add(totalCart);

      
            Button confirmCart = new Button
            {
                CssClass = "btnGlowLab",
                Text = "Conferma Carrello",
            };
            confirmCart.Click += ConfirmCart;
            Panel1.Controls.Add(confirmCart);
        }

        protected void RemoveFromCart(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int articoloId = Convert.ToInt32(btn.CommandArgument);
            for (int i = 0; i < HomePage.products.Count; i++)
            {
                if (HomePage.products[i].Id == articoloId)
                {
                    HomePage.products.RemoveAt(i);
                    Response.Redirect(Request.Url.AbsoluteUri);
                }
            }
        }
        protected void ConfirmCart(object sender, EventArgs e)
        {

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            string userId = Session["UserId"] as string;
            SqlCommand cmd2 = new SqlCommand($"INSERT INTO Carrello (idUtente) VALUES ('{userId}'); SELECT SCOPE_IDENTITY()", conn);
            int idcarrello = Convert.ToInt32(cmd2.ExecuteScalar());
            foreach (Quantity prodotti in HomePage.products)
            {
                SqlCommand cmd = new SqlCommand($"INSERT INTO Carrello_Prodotto (idprodotto,idcarrello,quant) VALUES ({prodotti.Id},{idcarrello},{prodotti.Quant})", conn);
                cmd.ExecuteNonQuery();
            }


        }
        protected void Cronologia(object sender, EventArgs e)
        {
            Response.Redirect("StoricoOrdini.aspx");
        }
    }
}