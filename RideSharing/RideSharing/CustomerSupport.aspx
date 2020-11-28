<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerSupport.aspx.cs" Inherits="RideSharing.CustomerSupport" %>

<!DOCTYPE html>

<link rel="stylesheet" href="CustomerSupportStyle.css"/>  <!-- add CSS file in HTML -->
<script src="CustomerSupportJavaScript.js"></script>            <!-- add JAVAscript file in HTML --> 

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>| Customer Support</title>
     <!-- add icon link -->
          <link rel = "icon" href ="https://icon-library.com/images/transportation_transport_vehicles_mustang_car-512.png" type = "image/x-icon"/> 
</head>
   
<body>
    <form id="form1" runat="server">
        <h1>Ride Sharing  | Customer Support</h1>
        <br />

        <!-- Enter guidance -->
        Enter guidance: 
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br /><br />

        <!--Send guidance -->
        Send guidance:
        <asp:Button ID="Button1" runat="server" OnClientClick="calcf1()" Text="Send" />
        <br /><br />

        <!-- Enter complaint -->
        Enter complaint: 
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br /><br />

        <!--Send complaint -->
        Send complaint:
        <asp:Button ID="Button2" runat="server" OnClientClick="calcf2()" Text="Send"  />
        <br /><br />

        <!--Go to Home Page of driver -->
        <asp:Button ID="Button3" runat="server" Text="Home" />
         <br /><br />

         <!--Reset everything -->
        <asp:Button ID="Button4" runat="server" OnClientClick="setval()"  Text="Reset" />
         <br /><br />


        <br /><br />
     
    </form>
</body>
</html>

