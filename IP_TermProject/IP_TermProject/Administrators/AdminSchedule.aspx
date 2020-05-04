<%@ Page Title="" Language="C#" UnobtrusiveValidationMode="None" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="AdminSchedule.aspx.cs" Inherits="IP_TermProject.MasterPages.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Page_Header" runat="server">
    <section id="hero" class="container">
        <header>
            <h2>User Drop Off Schedule</h2>
        </header>
    </section>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Page_Main" runat="server">
    <div style="text-align: center; margin: 4em 0 6em 0;">

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CCvsCV19ConnectionString %>" SelectCommand="SELECT * FROM [Schedules]" UpdateCommand="UPDATE [Schedules] SET [Sch_Status] = @Sch_Status WHERE [Sch_ID] = @Sch_ID">
            <UpdateParameters>
                <asp:Parameter Name="Sch_Status" Type="String" />
                <asp:Parameter Name="Sch_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Sch_ID" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="0" HorizontalAlign="Center" Width="75%">
            <Columns>
                <asp:CommandField ShowEditButton="True" EditText="Status">
                    <HeaderStyle Width="6%" />
                </asp:CommandField>
                <asp:BoundField DataField="Sch_ID" HeaderText="Schedule ID" InsertVisible="False" ReadOnly="True" SortExpression="Sch_ID">
                    <HeaderStyle Width="10%" />
                </asp:BoundField>
                <asp:BoundField DataField="User_ID" HeaderText="User ID" InsertVisible="False" ReadOnly="True" SortExpression="User_ID">
                    <HeaderStyle Width="8%" />
                </asp:BoundField>
                <asp:BoundField DataField="Sch_Username" HeaderText="Username" InsertVisible="False" ReadOnly="True" SortExpression="Sch_Username">
                    <HeaderStyle Width="15%" />
                </asp:BoundField>
                <asp:BoundField DataField="Sch_Email" HeaderText="Email" InsertVisible="False" ReadOnly="True" SortExpression="Sch_Email">
                    <HeaderStyle Width="18%" />
                </asp:BoundField>
                <asp:BoundField DataField="Sch_Item" HeaderText="Item" InsertVisible="False" ReadOnly="True" SortExpression="Sch_Item">
                    <HeaderStyle Width="10%" />
                </asp:BoundField>
                <asp:BoundField DataField="Sch_Date" HeaderText="Date" InsertVisible="False" ReadOnly="True" SortExpression="Sch_Date">
                    <HeaderStyle Width="10%" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Status" SortExpression="Sch_Status">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("Sch_Status") %>'>
                            <asp:ListItem Value="Requested">Requested</asp:ListItem>
                            <asp:ListItem Value="Accepted">Accept</asp:ListItem>
                            <asp:ListItem Value="Declined">Decline</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvStatus" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Please Accept or Decline"
                            InitialValue="Requested" SetFocusOnError="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Sch_Status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
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
    </div>
</asp:Content>
