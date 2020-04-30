<%@ Page Title="Corpus Christi vs. COVID-19" Language="C#" UnobtrusiveValidationMode="None" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreatePage.aspx.cs" Inherits="IP_TermProject.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Page_Header" runat="server">
    <!-- Hero -->
    <section id="hero" class="container">
        <header>
            <h2>Sign Up</h2>
        </header>
    </section>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Page_Main" runat="server">

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ForeColor="Red" />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Timer ID="Timer1" runat="server" Enabled="False" Interval="3500" OnTick="Timer1_Tick"></asp:Timer>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CCvsCV19ConnectionString %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>

    <div style="width: 100%; text-align: center; margin: 4em 0 6em 0;">
        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" Text="Label" ForeColor="Red" Visible="False"></asp:Label>
        <table style="text-align: center; width: 45%; margin: auto;" runat="server" id="Table1">
            <tr>
                <td style="width: 22%">
                    <asp:Label ID="Label2" runat="server" Text="Username:" Font-Bold="True" Font-Size="Large"></asp:Label>
                </td>
                <td style="width: 45%">
                    <asp:TextBox ID="txtUserName" runat="server" Font-Size="Medium"></asp:TextBox>
                </td>
                <td style="text-align: left;">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtUsername" ErrorMessage="Please provide Username" SetFocusOnError="True" ToolTip="Please provide Username" ForeColor="Red">*This field is required</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Email:" Font-Bold="True" Font-Size="Large"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Font-Size="Medium" TextMode="Email"></asp:TextBox></td>
                <td style="text-align: left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please provide Email" SetFocusOnError="True" ToolTip="Please provide Email" ForeColor="Red">*This field is required</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="First Name:" Font-Bold="True" Font-Size="Large"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server" Font-Size="Medium"></asp:TextBox>
                </td>
                <td style="text-align: left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Please provide First Name" SetFocusOnError="True" ToolTip="Please provide First Name" ForeColor="Red">*This field is required</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Last Name:" Font-Bold="True" Font-Size="Large"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server" Font-Size="Medium"></asp:TextBox>
                </td>
                <td style="text-align: left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtLastName" ErrorMessage="Please provide Last Name" SetFocusOnError="True" ForeColor="Red">*This field is required</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Password:" Font-Bold="True" Font-Size="Large"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Font-Size="Medium"></asp:TextBox>
                </td>
                <td style="text-align: left">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter password" SetFocusOnError="True" ForeColor="Red">*This field is required</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Comfirm Password:" Font-Bold="True" Font-Size="Large"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtRepeatPassword" runat="server" TextMode="Password" Font-Size="Medium"></asp:TextBox>
                </td>
                <td style="text-align: left">
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtRepeatPassword" Display="Dynamic" ErrorMessage="Please enter the same password" SetFocusOnError="True" ForeColor="Red">*Password doesn't match</asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtRepeatPassword" ErrorMessage="Please enter confirm password" Display="Dynamic" SetFocusOnError="True" ForeColor="Red">*This field is required</asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" Font-Bold="True" OnClick="btnSubmit_Click" />
    </div>
</asp:Content>
