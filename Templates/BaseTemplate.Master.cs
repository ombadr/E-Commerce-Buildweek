using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce_Epicode_Buildweek
{
    public partial class Template : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserId"] != null)
            {

                loginLink.Visible = false;
                logoutLink.Visible = true;
                carrelloLink.Visible = true;
                storicoLink.Visible = true;
                lblUsername.Text = "Benvenuto, " + Session["NomeUtente"].ToString();
            
            }
            else
            {
                loginLink.Visible = true;
                logoutLink.Visible = false;
                carrelloLink.Visible = false;
                storicoLink.Visible = false;
                lblUsername.Text = "Benvenuto, Ospite";
            }

        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Carrello_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }

        protected void Storico_Click(object sender, EventArgs e)
        {
            Response.Redirect("StoricoOrdini.aspx");
        }

    }
}