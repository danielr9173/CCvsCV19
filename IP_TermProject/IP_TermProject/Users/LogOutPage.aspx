<%@ Page Title="" Language="C#" UnobtrusiveValidationMode="None" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="LogOutPage.aspx.cs" Inherits="IP_TermProject.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Page_Header" runat="server">
    <!-- Hero -->
    <section id="hero" class="container">
        <header>
            <h2>Logging you out!</h2>
        </header>
    </section>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Page_Main" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Timer ID="Timer1" runat="server" Interval="3500" OnTick="Timer1_Tick"></asp:Timer>
    <div style="width: 100%; text-align: center; margin: 4em 0 6em 0;">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="Green" Text="Thank you for visiting!"></asp:Label>
    </div>
</asp:Content>
