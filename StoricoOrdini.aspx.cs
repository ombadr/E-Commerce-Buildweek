﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BuildWeekMattia
{
    public partial class StoricoOrdini : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CaricaOrdini();
            }
        }

        private void CaricaOrdini()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Ecommerce"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string userId = Session["UserId"] as string; 
                string query = $@"SELECT Utenti.*, Prodotto.*, Carrello_Prodotto.Quant, Carrello.idcarrello 
                        FROM Utenti 
                        INNER JOIN Carrello ON Utenti.idUtente = Carrello.idUtente 
                        INNER JOIN Carrello_Prodotto ON Carrello.idCarrello = Carrello_Prodotto.idCarrello 
                        INNER JOIN Prodotto ON Carrello_Prodotto.idProdotto = Prodotto.idProdotto 
                        WHERE Utenti.idUtente = '{userId}'"; 
                SqlCommand cmd = new SqlCommand(query, conn);
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    string htmlContent = "";
                    int currentOrderId = 0;
                    decimal orderTotal = 0;

                    while (reader.Read())
                    {
                        int orderId = reader.GetInt32(reader.GetOrdinal("idcarrello"));
                        if (currentOrderId != orderId)
                        {
                            if (currentOrderId != 0)
                            {
                               
                                htmlContent += $@"<h3 class=""text-end"">Totale : {orderTotal}</h3></div></div>";
                                orderTotal = 0; 
                            }

                         
                            htmlContent += $@"<div class=""row border border-2 rounded-4 mb-3"">
                                        <div class=""col-12"">
                                            <h2 class='text-center'>Numero Ordine: {orderId}</h2>
                                            <p>Dettagli: </p>
                                            <ul>";

                            currentOrderId = orderId;
                        }

                        string productName = reader.GetString(10);
                        int quantity = reader.GetInt32(reader.GetOrdinal("Quant"));
                        decimal price = reader.GetInt32(reader.GetOrdinal("Prezzo"));
                        orderTotal += quantity * price; 

                        htmlContent += $"<li>{productName} - Quantità: {quantity} - Prezzo {price}</li>";
                    }

                    if (currentOrderId != 0)
                    {
                        htmlContent += $@"<h3 class=""text-end"">Totale : {orderTotal}</h3></div></div>";
                    }

                    ordersContainer.InnerHtml = htmlContent; 
                }
            }
        }
    }
    }