<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/LoginRegistrazioneTemplate.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="E_Commerce_Epicode_Buildweek.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Login.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <label for="indirizzoEmail" class="form-label">E-mail</label>
        <input type="email" class="form-control" id="indirizzoEmail" name="indirizzoEmail">
    </div>
    <div>
        <label for="passwordUtente" class="form-label">Password</label>
        <input type="password" class="form-control" id="passwordUtente" name="passwordUtente">
    </div>
    <div>
        <p>Non hai un'account?</p>
        <a href="Registrazione.aspx">Registrati ora</a>
    </div>
    <button type="submit">Login</button>


</asp:Content>