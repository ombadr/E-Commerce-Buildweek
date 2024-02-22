using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce_Epicode_Buildweek
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                EseguiLogin();
            }
        }

        protected void EseguiLogin()
        {
            string email = Request.Form["indirizzoEmail"];
            string password = Request.Form["passwordUtente"];

            string connectionString = ConfigurationManager.ConnectionStrings["Ecommerce"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT IdUtente,Email, Password, TipoUtente, Nome FROM Utenti WHERE Email=@Email";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string userId = reader["IdUtente"].ToString();
                            string userEmail = reader["Email"].ToString();
                            string passwordHash = reader["Password"].ToString();
                            string tipoUtente = reader["TipoUtente"].ToString();
                            string nomeUtente = reader["Nome"].ToString();
                            
                            if (BCrypt.Net.BCrypt.Verify(password, passwordHash))
                            {

                                Session["UserId"] = userId;
                                Session["Email"] = userEmail;
                                Session["IsAdmin"] = tipoUtente.Equals("admin", StringComparison.OrdinalIgnoreCase);
                                Session["nomeUtente"] = nomeUtente;
                                if ((bool)Session["IsAdmin"])
                                {
                                    Response.Redirect("Amministrazione.aspx");

                                }
                                else
                                {
                                    Response.Redirect("HomePage.aspx");
                                    System.Diagnostics.Debug.WriteLine("Hello");
                                }
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "loginError", "alert('Email o password errata.')", true);

                            }
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "loginError", "alert('Email o password errata.')", true);

                        }
                    }
                }
            }
        }
    }
}