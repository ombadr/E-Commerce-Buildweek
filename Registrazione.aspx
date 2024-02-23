<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/LoginRegistrazioneTemplate.Master" AutoEventWireup="true" CodeBehind="Registrazione.aspx.cs" Inherits="E_Commerce_Epicode_Buildweek.Registrazione" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="registrazione.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <input type="text" class="form-control" placeholder="Nome" aria-label="Nome"
                name="nomeUtente">
        </div>
        <div>
            <input type="text" class="form-control" placeholder="Cognome" aria-label="Cognome"
                name="cognomeUtente">
        </div>
    </div>
    <div>
        <input type="email" class="form-control" placeholder="Email" id="indirizzoEmail" name="indirizzoEmail">
    </div>
    <div>
        <input type="password" class="form-control" placeholder="Password" id="passwordUtente" name="passwordUtente">
    </div>
    <div>
        <p>Hai già un'account?</p>
        <a href="Login.aspx">Login</a>
    </div>
    <button type="submit">Registrati</button>

</asp:Content>