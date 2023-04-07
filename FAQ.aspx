<%@ Page Language="VB" MasterPageFile="~/MasterPage_1.master" AutoEventWireup="false"
    CodeFile="FAQ.aspx.vb" Inherits="FAQ" Title="FAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderInMasterPage"
    runat="Server">
    <h3 class="title">
        FAQ</h3>
    <ol class="faq">
        <a name="0"></a>
            <li><b><a href="#1">How do I place an order?</a></b></li>
            <li><b><a href="#2">What are your hours of operation?</a></b></li>
            <li><b><a href="#3">Do you ship outside of Canada?</a></b></li>
            <li><b><a href="#4">What currency are your prices denominated in?</a></b></li>
            <li><b><a href="#5">How long will it take to get my order?</a></b></li>
            <li><b><a href="#6">What methods of payment do you accept?</a></b></li>
            <li><b><a href="#7">Who is the manufacturer of your products?</a></b></li>
            <li><b><a href="#8">What should I do if I cannot find the product I am looking for on
                your website?</a></b></li>
            <li><b><a href="#9">Is it safe to place my order online using my credit card?</a></b></li>
            <li><b><a href="#10">If I find a better price on a competitor website, what is your
                policy?</a></b></li>
            <li><b><a href="#11">Do you require a prescription?</a></b></li>
    </ol>
    <ol class="anwser">
        <li><a name="1"></a>
            <h3>How do I place an order?</h3>
            <p>
                You can order online through our secure website or by calling us toll-free at
                <%=Common.WebSetting.Setting.TollFreeTel%>. Our highly trained team of Account Managers
                would be happy to assist you with the ordering process.</p>
            <a href="#">Back to top</a> </li>
        <li><a name="2"></a>
            <h3>What are your hours of operation?</h3>
            <p>
                Our Account Managers are available to serve you during the hours of 7:00am to 5:00pm
                (PST) Monday to Friday. You can also place your entire order online through our
                secure website 24 hours a day, 7 days a week.</p>
            <a href="#">Back to top</a> </li>
        <li><a name="3"></a>
            <h3>Do you ship outside of Canada?</h3>
            <p>
                Yes, we specialize in shipping to countries all around the world.</p>
            <a href="#">Back to top</a> </li>
        <li><a name="4"></a>
            <h3>What currency are your prices denominated in?</h3>
            <p>
                All prices on our website are in United States Dollars (USD).</p>
            <a href="#">Back to top</a> </li>
        <li><a name="5"></a>
            <h3>How long will it take to get my order?</h3>
            <p>
                Your order is shipped the same day and you should receive your order within 2-10
                business days. For time-sensitive urgent deliveries, please feel free to contact
                one of our Account Managers at
                <%=Common.WebSetting.Setting.TollFreeTel%>
                to inquire about special arrangements and expedited shipments.</p>
            <a href="#">Back to top</a> </li>
        <li><a name="6"></a>
            <h3>What methods of payment do you accept?</h3>
            <p>
                We offer a number of convenient payment options. We accept Visa, MasterCard, Discover,
                American Express, International Money Orders or Bank Drafts, and Bank Wires.</p>
            <p>
                We also accept personal checks and offer 30 day payment terms for qualified clients.
                Please contact us for additional details on these options.</p>
            <a href="#">Back to top</a> </li>
        <li><a name="7"></a>
            <h3>Who is the manufacturer of your products?</h3>
            <p>
                All of our products are manufactured by FDA approved national manufacturers. The
                Synvisc is manufactured by Genzyme, Hyalgan is manufactured by Fidia, and Restylane
                is manufactured by Q-Med. We guarantee the quality of all of our products. Should
                you have any questions about our products, please contact us at
                <%=Common.WebSetting.Setting.TollFreeTel%>.</p>
            <a href="#">Back to top</a> </li>
        <li><a name="8"></a>
            <h3>What should I do if I cannot find the product I am looking for on your website?</h3>
            <p>
                If you are unable to find a product on our website, please feel free to call us
                and an account manager can assist with you locating the product and providing price
                quotes.</p>
            <a href="#">Back to top</a> </li>
        <li><a name="9"></a>
            <h3>Is it safe to place my order online using my credit card?</h3>
            <p>
                Yes, it is completely safe to order online using your credit card. The privacy and
                security of your data is our top priority and we go to great lengths to ensure that
                you are protected every step of the way. Our website utilizes industry-standard
                security measures, including 128-bit SSL (Secure Sockets Layer) encryption to encrypt
                and protect all personal and financial information. Your account information is
                completely secure.</p>
            <a href="#">Back to top</a> </li>
        <li><a name="10"></a>
            <h3>If I find a better price on a competitor website, what is your policy?</h3>
            <p>
                We always guarantee the lowest prices. If you find a lower price advertised on a
                competitor website, simply let us know and we'll beat that price by 10% of the price
                difference. To submit a price beat request, simply click on the button that reads
                "Price Beat" next to the drug entry and enter the requested details. Once we verify
                the competing price, we'll beat that price by 10% of the difference. You can also
                call us at
                <%=Common.WebSetting.Setting.TollFreeTel%>
                and one of our Account Managers would be happy to help you with your price beat
                request.</p>
            <a href="#">Back to top</a> </li>
        <li><a name="11"></a>
            <h3>Do you require a prescription?</h3>
            <p>
                We do require prescriptions for all products classified as prescription-only products.
                Please contact one of our Account Managers at
                <%=Common.WebSetting.Setting.TollFreeTel%>
                for more information.</p>
            <a href="#">Back to top</a> </li>
    </ol>
</asp:Content>
