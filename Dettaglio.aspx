<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/BaseTemplate.Master" AutoEventWireup="true" CodeBehind="Dettaglio.aspx.cs" Inherits="E_Commerce_Epicode_Buildweek.Dettaglio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Dettaglio.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5 d-flex justify-content-around">
        <div>
            <h2 id="ttlProdotto" runat="server" class="text-center fw-bold text-uppercase">Nome prodotto</h2>
            <div class="imgCard d-flex justify-content-center m-5">
                <img id="img" src="" alt="" class="" runat="server" width="300" />
            </div>
        </div>
        <div>
            <div class="p-5">
                <p id="txtDescrizione" runat="server" class="text-center my-5 fs-5 fw-bold"></p>
                <p id="txtDettagli" runat="server" class="text-center my-5 fs-6"></p>
                <p id="txtPrezzo" runat="server" class="text-center mb-5 fs-5 fw-bold"></p>

                <div class="d-flex align-items-baseline">
                    <asp:Button runat="server" Text="Aggiungi al carrello" OnClick="btnAcquista_Click" CssClass="btnGlowLab" />
                    <div class="d-flex align-items-center ms-3">
                        <div class="d-flex align-items-baseline">
                            <asp:TextBox ID="QuantitaTextBox" runat="server" CssClass="form-control" Text="1" type="number" Width="55px" />
                            <div class="input-group ms-3">
                                <div class="d-flex align-items-baseline">
                                    <asp:Button runat="server" Text="➖" CssClass="btnGlowLab" OnClick="decrement" />
                                    <asp:Button runat="server" Text="➕" CssClass="btnGlowLab" OnClick="increment" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
