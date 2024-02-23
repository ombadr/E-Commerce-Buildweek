<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Templates/BaseTemplate.Master" CodeBehind="BackOfficeDetails.aspx.cs" Inherits="BuildWeekMattia.BackOfficeDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="BackOfficeDetails.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container m-4">
        <div class="row d-flex">

            <div class="col-3 d-flex align-items-center">
                <img class="imgCard" id="imgurl" runat="server" style="width: 240px; height: 260px;" src="" />

            </div>
            <div class="col-9">
                <div class="row">
                    Url Immagine:<asp:TextBox ID="Urltxt" runat="server" Style="height: 50px;" Text='' />
                </div>
                <div class="row">
                    Descrizione:<asp:TextBox ID="Desctxt" runat="server" Style="height: 50px;" Text='' />
                </div>
                <div class="row">
                    Nome:<asp:TextBox ID="Nametxt" runat="server" Style="height: 50px;" Text='' />
                </div>
                <div class="row">
                    Dettagli:<asp:TextBox ID="Dettxt" runat="server" Style="height: 50px;" Text='' />
                </div>
                <div class="row">
                    Prezzo(in €):<asp:TextBox ID="Pricetxt" runat="server" Style="height: 50px;" Text='' />
                </div>

            </div>

        </div>

        <div class="m-4">

        <asp:Button ID="Mod" runat="server" Text="Modifica" CommandName="Mod" class="btnGlowLab" CommandArgument='' OnClick="Mod_Click" />
        <asp:Button ID="DelBtn" runat="server" Text="Rimuovi" UseSubmitBehavior="false" CommandName="Delete" class="btnGlowLab" CommandArgument='' OnClick="DelBtn_Click" />
        <asp:Button ID="BackToAdminBtn" runat="server" Text="Torna indietro" OnClick="BackToAdminBtn_Click" CssClass="btnGlowLab" />

        </div>


    </div>
</asp:Content>
