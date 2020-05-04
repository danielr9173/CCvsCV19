<%@ Page Title="Info" Language="C#" MasterPageFile="~/MasterPages/Site.Master" AutoEventWireup="true" CodeBehind="InfoPage.aspx.cs" Inherits="IP_TermProject.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Page_Header" runat="server">
    <!-- Hero -->
    <section id="hero" class="container">
        <header>
            <h2>Info</h2>
        </header>
        <p>One of the most helpful things you can do to help your community fight COVID-19 is to provide PPEs (Personal Protective Equipment) to those who work in the medical field.</p>

    </section>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Page_Main" runat="server">
    <section class="wrapper">
        <div class="container">
            <h2>How to make Face Shields</h2>
            <p>It is possible to manufacture your own face shields and send them to your local hospital if they are needed. 
                It is important for whatever number of people you are making masks that they all receive the exact same type of shield. 
                That means you should 3D print using the same file. If not everyone is using the same mask, it can be harder to print the correct parts for everyone.
                Using a single type of mask will be efficient for mass producing parts. Provided is a free file for 3D printing a <a href="https://www.prusaprinters.org/prints/25857-prusa-face-shield" style="font-weight:bold" target="_blank">Prusa Face Shield</a>. 
                You should buy more materials than you think you will need to ensure that you have enough for creating the face shields. 
                The most efficient way to manufacture face shields is injection molding, but creating the mold for the shields can take some time. 
                The injection molding method can also be very expensive. Finding a local business that can help out with injection molding would be very beneficial to our cause.<br /><br />
                Now for making transparent shield, the ideal thickness for a reusable shield is widely agreed to be 20 inch PETG, but because of supply chain issues, 
                we elected to use 7 mil transparencies cut to fit. You can process these transparencies several ways, the first way is to hole punch them out but that was tedious and time consuming.
                The second way is to use a drill to drill multiple shields at once, but this is risky if you are not careful because you can melt it.
            </p>
            <br />

            <h2>Precautions</h2>
            <p>If you choose to manufacture face shields for anyone, you should take certain precautions for the health and safety of anyone involved.<br />This information can be found in the previous link.</p>
            <ul>
                <li>Wear gloves and a mask while manufacturing face shields.</li>
                <li>Inform the receiving party of the environment in which the shields are being manufactured.</li>
                <li>Store your manufactured face shields for 2-3 days to ensure that there is no risk of infection when handling the shields.</li>
                <li>Do not keep your shields in one place in order to reduce the risk of cross contamination</li>
            </ul>
            <br />

            <h2>Packaging and Distribution</h2>
            <p>When you have finished manufacturing enough face shields, you will need to create a kit for each shield. Each kit should contain the following:</p>
            <ul>
                <li>A face shield frame</li>
                <li>A head band for the face shield</li>
                <li>The actual plastic shield</li>
                <li>An instruction booklet for using the face shield</li>
                <li>A liability waiver to acknowledge that your face shields may not be up to the usual PPE standards due to being provided during an emergency</li>
            </ul>
            <p>Make sure that each kit has been correctly created before dropping it off at our facilities. Our staff will be able to help with disinfecting our kits to properly send them to the hospital. 
                Be sure to schedule for a drop off date a day in advance before delivering the face shields. It is not a good idea to simply drive to the hospital with the face shields as the hospital's operating with sterile equipment.
                Also, hospital hours may differ greatly during this pandemic.
            </p>


        </div>
    </section>
</asp:Content>
