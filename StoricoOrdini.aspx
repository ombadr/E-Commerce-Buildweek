<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/BaseTemplate.Master" AutoEventWireup="true" CodeBehind="StoricoOrdini.aspx.cs" Inherits="BuildWeekMattia.StoricoOrdini" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <%-- <div id="idordine" runat="server"></div>
    <div id="ordini" runat="server"></div>--%>
     <%-- <div class="container mt-3">
           <div class="row border border-2 rounded-4">
            <div class="col-12">
                <h2>Numero Ordine: 12</h2>
                <p>Dettagli: </p>
                <ul>
                    <li>Nome prodotto - Quantità: 1 - Prezzo 15</li>
                    <li>Nome prodotto - Quantità: 1 - Prezzo 15</li>
                    <li>Nome prodotto - Quantità: 1 - Prezzo 15</li>
                </ul>
                <h3>Totale : 25</h3>
            </div>
          </div>
        </div>--%>

        <div class="container my-3" runat="server" id="ordersContainer"></div>

    
</asp:Content>
