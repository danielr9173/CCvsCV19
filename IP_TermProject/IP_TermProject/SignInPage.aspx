<%@ Page Title="Corpus Christi vs. COVID-19" Language="C#" UnobtrusiveValidationMode="None" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignInPage.aspx.cs" Inherits="IP_TermProject.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Page_Header" runat="server">
    <!-- Hero -->
    <section id="hero" class="container">
        <header>
            <h2>Login In</h2>
        </header>
    </section>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Page_Main" runat="server">

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" ShowSummary="False" ValidationGroup="UserLogin" />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Timer ID="Timer1" runat="server" Enabled="False" Interval="3500" OnTick="Timer1_Tick"></asp:Timer>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CCvsCV19ConnectionString %>" SelectCommand="SELECT [User_Username], [User_Password] FROM [Users]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CCvsCV19ConnectionString %>" SelectCommand="SELECT [Admin_Username], [Admin_Password] FROM [Administrators]"></asp:SqlDataSource>

    <div style="width: 100%; text-align: center; margin: 4em 0 6em 0;">
        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
        <table style="text-align: center; width: 45%; margin: auto;" runat="server" id="Table1">
            <tr>
                <td style="width: 25%">
                    <asp:Label ID="Label1" runat="server" Text="Enter Username:" Font-Size="Large" Font-Bold="true"></asp:Label></td>
                <td style="width: 45%">
                    <asp:TextBox ID="txtUsername" runat="server" Font-Size="Large"></asp:TextBox>
                </td>
                <td style="text-align: left;">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" ErrorMessage="Please enter username." SetFocusOnError="True" ForeColor="Red" Display="Dynamic" ValidationGroup="UserLogin">*This field is required</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Enter Password:" Font-Size="Large" Font-Bold="true"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" Font-Size="Large" TextMode="Password"></asp:TextBox>
                </td>
                <td style="text-align: left;">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="UserLogin" ControlToValidate="txtPassword" ErrorMessage="Please enter password" SetFocusOnError="True" ForeColor="Red" Display="Dynamic">*This field is required</asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnSubmit" runat="server" Text="Login" ValidationGroup="UserLogin" Font-Bold="True" OnClick="btnSubmit_Click" />
    </div>
</asp:Content>
