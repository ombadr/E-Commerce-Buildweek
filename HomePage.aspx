<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/BaseTemplate.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="E_Commerce_Epicode_Buildweek.HomePage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="HomePage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="hero">
    <h1 class="text-center fw-bold fst-italic text-uppercase mb-5">GlowLab Shop</h1>
        </div>
    <div class="row">
            <asp:Repeater ID="RepeaterBackoffice" runat="server">
                <ItemTemplate>
                    <div class="cardContainer col-4">
                        <div class="card">
                            <div class="image-container">
                                <img src='<%# Eval("Immagine") %>' alt='<%# Eval("Nome") %>' />
                                <div class="overlay">
                                    <a
                                        href='<%# "Dettaglio.aspx?product=" + Eval("Id") %>'>Dettagli</a>
                                </div>
                            </div>
                            <div class="cardBody">
                                <h5><%# Eval("Nome") %></h5>
                                <p><%# Eval("Prezzo") %>&euro;</p>
                            </div>

                            <asp:Button ID="AcquistaBtnHome" runat="server" Text="Aggiungi al carrello" CommandArgument='<%# Eval("Id") %>' OnClick="AddToCart" class="btnGlowLab" />
                        </div>
                    </div>


                </ItemTemplate>
            </asp:Repeater>
        </div>
</asp:Content>
