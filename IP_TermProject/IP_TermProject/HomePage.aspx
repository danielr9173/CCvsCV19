<%@ Page Title="Corpus Christi vs. COVID-19" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="IP_TermProject.WebForm1" %>

<asp:Content ID="Content_Header" ContentPlaceHolderID="Page_Header" runat="server">
    <!-- Hero -->
    <section id="hero" class="container">
        <header>
            <h2>Corpus Christi needs your help!</h2>
        </header>
        <p>
            To beat the <a href="https://www.cdc.gov/coronavirus/2019-ncov/index.html" target="_blank">Coronavirus Disease</a>, our local hospitals need to protect themselves from getting infected.
			By showing our support we are helping out by making and contributing Personal Protective Equipment such as face sheilds and masks. 
			These PPE's are the most beneficial to our local health workers by protecting their facial region from getting infected by Covid-19.

        </p>
        <ul class="actions">
            <li><a href="CreatePage.aspx" class="button" runat="server" id="btnStart">Lets get started</a></li>
        </ul>
    </section>

</asp:Content>

<asp:Content ID="Content_Main" ContentPlaceHolderID="Page_Main" runat="server">
    <!-- Features 1 -->
    <div class="wrapper">
        <div class="container">
            <div class="row">
                <section class="col-6 col-12-narrower feature">
                    <div class="image-wrapper first">
                        <a href="#" class="image featured first">
                            <img src="images/CC.png" alt="" /></a>
                    </div>
                    <header>
                        <h2>Project Goals</h2>
                    </header>
                    <p>
                        Again we are forming groups of volunteers who have the means to make PPE's 
                        such as face sheilds and masks, so they can be donated to our local hopitals.
                    </p>
                    <ul class="actions">
                        <li><a href="#" class="button">Read More</a></li>
                    </ul>
                </section>
                <section class="col-6 col-12-narrower feature">
                    <div class="image-wrapper">
                        <a href="#" class="image featured">
                            <img src="images/faceshields.png" alt="" /></a>
                    </div>
                    <header>
                        <h2>Getting Started</h2>
                    </header>
                    <p>
                        Learn how to start saving lifes with the contribute of face shields and masks today!
                    </p>
                    <ul class="actions">
                        <li><a href="InfoPage.aspx" class="button">Learn More</a></li>
                    </ul>
                </section>
            </div>
        </div>
    </div>

    <div runat="server" id="Drop_Off">
        <div id="promo-wrapper">
            <section id="promo">
                <h2>Drop off Scheduling</h2>
                <p>Finished manufacturing your PPE's? Schedulea drop off date with us to get it sent as soon as possible.</p>
                <a href="#" class="button">Schedule</a>
            </section>
        </div>
    </div>
</asp:Content>
