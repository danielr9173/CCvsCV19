<%@ Page Title="" Language="C#" UnobtrusiveValidationMode="None" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="UserScheduling.aspx.cs" Inherits="IP_TermProject.MasterPages.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Page_Header" runat="server">
    <section id="hero" class="container">
        <header>
            <h2>Schedule Drop Off Date</h2>
        </header>
        <p>
            Thank you
            <asp:Label ID="lblUser" runat="server" Text=""></asp:Label>&nbsp;for helping
            our cause to better protect our local medical workers from getting infected by the 
            Coronavirus Disease. This will greatly decrease the rate of infection within our local
            hospitals which will save more lifes as time goes on.
        </p>
    </section>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Page_Main" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Timer ID="Timer1" runat="server" Enabled="False" Interval="6000" OnTick="Timer1_Tick"></asp:Timer>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ForeColor="Red" ValidationGroup="Submit" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CCvsCV19ConnectionString %>" SelectCommand="SELECT * FROM [Schedules] WHERE ([Sch_Username] = @Sch_Username)">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblControl" Name="Sch_Username" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CCvsCV19ConnectionString %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
    <asp:Label ID="lblControl" runat="server" Text="" Visible="False"></asp:Label>

    <div style="text-align: center; margin: 4em 0 6em 0;">

        <asp:Label ID="Label4" runat="server" Text="Label" Visible="False" Font-Bold="True" Font-Size="Large"></asp:Label>

        <table style="text-align: center; width: 55%; height: 739px; margin: auto;" runat="server" id="Table1" visible="false">
            <tr>
                <td style="width: 15%; height: 76px;">
                    <asp:Label ID="Label1" runat="server" Text="The Amazing:"></asp:Label>
                </td>
                <td style="height: 76px">
                    <asp:TextBox ID="txtFullname" runat="server" ReadOnly="true" Width="50%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="height: 89px">
                    <asp:Label ID="Label2" runat="server" Text="What Item?"></asp:Label>
                </td>
                <td style="height: 89px">
                    <asp:DropDownList ID="ddlItem" runat="server" Width="35%">
                        <asp:ListItem Value="(Select Item)">(Select Item)</asp:ListItem>
                        <asp:ListItem Value="Face Shield">Face Shield</asp:ListItem>
                        <asp:ListItem Value="Face Mask">Face Mask</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="width: 2%; height: 89px;">
                    <asp:RequiredFieldValidator ID="rfvItem" runat="server" ControlToValidate="ddlItem" ErrorMessage="Please select a item"
                        InitialValue="(Select Item)" SetFocusOnError="True" ForeColor="Red" ValidationGroup="Submit">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="height: 498px">
                    <asp:Label ID="Label3" runat="server" Text="Drop off date:"></asp:Label>
                </td>
                <td style="height: 498px">
                    <asp:Calendar ID="Calendar1" runat="server" Width="76%" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="457px" OnDayRender="Calendar1_DayRender" OnPreRender="Calendar1_PreRender">
                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" Font-Bold="True" Font-Size="Large" />
                        <DayStyle Font-Bold="False" Font-Size="Large" />
                        <NextPrevStyle Font-Size="Large" ForeColor="#CCCCFF" Font-Bold="True" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" Font-Size="Large" />
                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" Font-Size="Medium" />
                        <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="Large" ForeColor="#CCCCFF" Height="25px" />
                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                        <WeekendDayStyle BackColor="#CCCCFF" />
                    </asp:Calendar>
                </td>
            </tr>
        </table>

        <table style=" width: 27%; height: 55px; margin: auto;" runat="server" id="btnTable" visible="false">
            <tr>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" Font-Bold="True" OnClick="btnSubmit_Click" Height="61px" Width="163px" ValidationGroup="Submit"/>
                </td>
                <td>
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Font-Bold="True" Height="61px" Width="163px" OnClick="btnCancel_Click"/>
                </td>
            </tr>
        </table>       

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Sch_ID" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="35%" Visible="false">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Sch_Item" HeaderText="Item" SortExpression="Sch_Item">
                    <HeaderStyle Width="25%" />
                </asp:BoundField>
                <asp:BoundField DataField="Sch_Date" HeaderText="Scheduled Date" SortExpression="Sch_Date">
                    <HeaderStyle Width="25%" />
                </asp:BoundField>
                <asp:BoundField DataField="Sch_Status" HeaderText="Status" SortExpression="Sch_Status" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:Button ID="btnSchedule" runat="server" Text="Schedule New Date" Font-Bold="True" Width="270px" Visible="false" OnClick="btnSchedule_Click" />

    </div>
</asp:Content>
