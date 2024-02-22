<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Templates/BaseTemplate.Master" CodeBehind="Amministrazione.aspx.cs" Inherits="BuildWeekMattia.Amministrazione" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Amministrazione.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-4 fs-1 fw-bold">AMMINISTRAZIONE</div>
        <button type="button" class="btnGlowLab" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Aggiungi Nuovo Articolo
</button>
            <div class="row mt-4">
                 <div class="col fs-6">IMMAGINE</div>
                 <div class="col fs-6">NOME</div>
                 <div class="col fs-6">DESCRIZIONE</div>
                 <div class="col fs-6">DETTAGLIO</div>
                 <div class="col fs-6">PREZZO</div>
                 <div class="col"></div>
            </div>
   
    <asp:Repeater ID="RepeaterBackoffice" runat="server">
        <ItemTemplate>
            <div class="row m-3">
                <div class="d-flex">
                    <div class="col imgCard">
                        <img style="width: 160px; height: 180px;" src="<%# Eval("Immagine") %>" />
                    </div>
                    <div class="col">
                        <div style="height: 210px;" id="Nametxt" class="form-control">
                            <%# Eval("Nome") %>
                        </div>
                    </div>
                    <div class="col">
                        <div style="height: 210px;" id="Desctxt" class="form-control" style="word-wrap: break-word;">
                            <%# Eval("Descrizione") %>
                        </div>
                    </div>
                    <div class="col">
                        <div style="height: 210px;" id="Detailstxt" class="form-control" style="word-wrap: break-word;">
                            <%# Eval("Dettagli") %>
                        </div>
                    </div>
                    <div class="col">
                        <div style="height: 210px;" id="Pricetxt" class="form-control">
                            <%# Eval("Prezzo")+"€" %>
                        </div>
                    </div>

                    <div class="col">
                        <asp:Button ID="Mod" runat="server" Text="Modifica" UseSubmitBehavior="false" CommandName="Mod" CssClass="btnGlowLab" CommandArgument='<%# Eval("Id") %>' OnClick="Mod_Click" />
                        <asp:Button ID="DelBtn" runat="server" Text="Rimuovi" UseSubmitBehavior="false" CommandName="Delete" CssClass="btnGlowLab" CommandArgument='<%# Eval("Id") %>' OnClick="DelBtn_Click" />
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Aggiungi Articolo</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="d-flex">
                    <p style="width: 120px;">Nome Prodotto:</p>
                    <asp:TextBox ID="TextBoxNome" runat="server"></asp:TextBox>
                </div>
                <div class="d-flex">
                    <p style="width: 120px;">Descrizione:</p>
                    <asp:TextBox ID="TextBoxDescrizione" runat="server"></asp:TextBox>
                </div>
                <div class="d-flex">
                    <p style="width: 120px;">Dettagli:</p>
                    <asp:TextBox ID="TextBoxDettagli" runat="server"></asp:TextBox>
                </div>
                <div class="d-flex">
                    <p style="width: 120px;">Prezzo:</p>
                    <asp:TextBox ID="TextBoxPrezzo" runat="server"></asp:TextBox>
                </div>
                <div class="d-flex">
                    <p style="width: 120px;">Immagine:</p>
                    <asp:TextBox ID="TextBoxImg" runat="server"></asp:TextBox>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <asp:Button runat="server" ID="SaveChanges" OnClick="SaveChanges_Click" class="btn btn-primary" Text="Save Changes"></asp:Button>
                </div>
            </div>
        </div>

    </div>
</div>
</asp:Content>
