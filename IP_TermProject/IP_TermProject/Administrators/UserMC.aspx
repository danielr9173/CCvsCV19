<%@ Page Title="User Management Console" Language="C#" UnobtrusiveValidationMode="None" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="UserMC.aspx.cs" Inherits="IP_TermProject.WebForm6" %>

<asp:Content ID="content1" ContentPlaceHolderID="Page_Header" runat="server">
    <section id="hero" class="container">
        <header>
            <h2>Manage Users</h2>
        </header>
        <p>
            There are
            <asp:Label ID="lblUserCount" runat="server" Text="n"></asp:Label>&nbsp;registered users.
        </p>
    </section>
</asp:Content>

<asp:Content ID="content2" ContentPlaceHolderID="Page_Main" runat="server">
    <div style="text-align: center; margin: 4em 0 6em 0;">

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" ShowSummary="False" />
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CCvsCV19ConnectionString %>" SelectCommand="SELECT [User_Username], [User_Email], [User_ID] FROM [Users]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CCvsCV19ConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [User_ID] = @User_ID" InsertCommand="INSERT INTO [Users] ([User_Username], [User_Password], [User_Email], [User_FName], [User_LName]) VALUES (@User_Username, @User_Password, @User_Email, @User_FName, @User_LName)" SelectCommand="SELECT * FROM [Users] WHERE ([User_ID] = @User_ID)" UpdateCommand="UPDATE [Users] SET [User_Username] = @User_Username, [User_Password] = @User_Password, [User_Email] = @User_Email, [User_FName] = @User_FName, [User_LName] = @User_LName WHERE [User_ID] = @User_ID">
            <DeleteParameters>
                <asp:Parameter Name="User_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="User_Username" Type="String" />
                <asp:Parameter Name="User_Password" Type="String" />
                <asp:Parameter Name="User_Email" Type="String" />
                <asp:Parameter Name="User_FName" Type="String" />
                <asp:Parameter Name="User_LName" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="UserGrid" Name="User_ID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="User_Username" Type="String" />
                <asp:Parameter Name="User_Password" Type="String" />
                <asp:Parameter Name="User_Email" Type="String" />
                <asp:Parameter Name="User_FName" Type="String" />
                <asp:Parameter Name="User_LName" Type="String" />
                <asp:Parameter Name="User_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>


        <asp:GridView ID="UserGrid" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" CellPadding="3" DataKeyNames="User_ID" DataSourceID="SqlDataSource1" HorizontalAlign="Center" Width="45%" GridLines="Horizontal">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="User_ID" HeaderText="User ID" InsertVisible="False" ReadOnly="True" SortExpression="User_ID" />
                <asp:BoundField DataField="User_Username" HeaderText="User Username" SortExpression="User_Username" />
                <asp:BoundField DataField="User_Email" HeaderText="User Email" SortExpression="User_Email" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>

        <asp:DetailsView ID="UserDetails" runat="server" Height="50px" Width="35%" AutoGenerateRows="False" CellPadding="4" DataKeyNames="User_ID" DataSourceID="SqlDataSource2" HorizontalAlign="Center" OnItemDeleted="UserDetails_ItemDeleted" OnItemInserted="UserDetails_ItemInserted" OnItemUpdated="UserDetails_ItemUpdated" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#B9D0FF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="User_ID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("User_ID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("User_ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Username" SortExpression="User_Username">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("User_Username") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditUsername" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please provide Username" SetFocusOnError="True" ToolTip="Please provide Username" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtUsername" runat="server" Text=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Please provide Username" SetFocusOnError="True" ToolTip="Please provide Username" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("User_Username") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Width="30%" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Password" SortExpression="User_Password">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("User_Password") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditPassword" runat="server" ControlToValidate="TextBox2" ErrorMessage="Please provide Password" SetFocusOnError="True" ToolTip="Please provide Password" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtPassword" runat="server" Text=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please provide Password" SetFocusOnError="True" ToolTip="Please provide Password" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("User_Password") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="User_Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" TextMode="Email" Text='<%# Bind("User_Email") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditEmail" runat="server" ControlToValidate="TextBox3" ErrorMessage="Please provide Email" SetFocusOnError="True" ToolTip="Please provide Email" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" Text=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please provide Email" SetFocusOnError="True" ToolTip="Please provide Email" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("User_Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="First Name" SortExpression="User_FName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("User_FName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditFNmae" runat="server" ControlToValidate="TextBox4" ErrorMessage="Please provide First Name" SetFocusOnError="True" ToolTip="Please provide First Name" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtFName" runat="server" Text=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertFName" runat="server" ControlToValidate="txtFName" ErrorMessage="Please provide First Name" SetFocusOnError="True" ToolTip="Please provide First Name" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("User_FName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Name" SortExpression="User_LName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("User_LName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditLName" runat="server" ControlToValidate="TextBox5" ErrorMessage="Please provide Last Name" SetFocusOnError="True" ToolTip="Please provide Last Name" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="txtLName" runat="server" Text=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertLName" runat="server" ControlToValidate="txtLName" ErrorMessage="Please provide Last Name" SetFocusOnError="True" ToolTip="Please provide Last Name" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("User_LName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>

    </div>
</asp:Content>
