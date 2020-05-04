<%@ Page Title="" Language="C#" UnobtrusiveValidationMode="None" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="IP_TermProject.MasterPages.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Page_Header" runat="server">
    <section id="hero" class="container">
        <header>
            <h2>Welcome <asp:Label ID="lblAdmin" runat="server" Text=""></asp:Label></h2>
        </header>
        <p>
            Please check if users have schedules new drop off dates that need your approval. Also, please 
            assist in the up keeping of the site by accessing the management console for the website.
        </p>
    </section>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Page_Main" runat="server">
    <!-- Features 1 -->
    <div class="wrapper">
        <div class="container">
            <div class="row">
                <section class="col-6 col-12-narrower feature">
                    <div class="image-wrapper first">
                        <a href="AdminSchedule.aspx" class="image featured first">
                            <img src="../images/pic07.jpg" alt="" /></a>
                    </div>
                    <header>
                        <h2>User Scheduling</h2>
                    </header>
                    <p>
                        This is where you can manage the dates of which the user/volunteer can drop off their crafted
                        PPE's to be processed. This will make it more manageable for the staff to properly clean the 
                        PPE's.
                    </p>
                    <ul class="actions">
                        <li><a href="AdminSchedule.aspx" class="button">Schedule Status</a></li>
                    </ul>
                </section>
                <section class="col-6 col-12-narrower feature">
                    <div class="image-wrapper">
                        <a href="UserMC.aspx" class="image featured">
                            <img src="../images/pic05.jpg" alt="" /></a>
                    </div>
                    <header>
                        <h2>User Management Console</h2>
                    </header>
                    <p>
                        This is where you can see the list of users of the site and their personal information. The console is
                        for the propose of managing each user by editing, deleting, or inserting to the website database.
                    </p>
                    <ul class="actions">
                        <li><a href="UserMC.aspx" class="button">Go to Console</a></li>
                    </ul>
                </section>
            </div>
        </div>
    </div>
</asp:Content>
