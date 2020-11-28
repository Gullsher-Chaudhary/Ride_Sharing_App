<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePassenger.aspx.cs" Inherits="RideSharing.HomePassenger" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Passenger Home</title>
</head>
    <style>
        :before {
    background: url(img/hg.jpeg) no-repeat center center/cover;
    content: '';
    position: absolute;
    top: 0%;
    left: 0%;
    height: 100%;
    width: 100%;
    z-index: -1;
    opacity: 0.5;
    
}
*{
    scroll-behavior: smooth;
    margin: 0px;
    padding: 0px;
}



.navbar{
    background-color: black;
    height: 85px;
    width: 100%;
    position: absolute;
    top: 0;
    left: 0;
}

.name{
    display: block;
    float: left;
}

.name ul{
    display: flex;
}

.name ul li {
    font-size: 46px;
    list-style: none;
    position: absolute;
    top: 2%;
    left: 6%;
    padding: 10px 0px;

}

.name ul li a{
    color: crimson;
    text-decoration: none;
    font-family: 'Righteous',cursive;
}

.nav-menu{
    display: block;

}

.nav-menu ul {
    display: flex;
    float: right;
    top: 10%;
}

.nav-menu ul li{
    display: block;
    font-size: 22px;
    font-weight: bold;
    padding: 40px 5px;



}

.nav-menu ul li a{
    color: white;
    /* font-family: 'Piazzolla', serif; */
    font-family: 'Commissioner', sans-serif;

    text-decoration: none;

}


.nav-menu ul li a:hover{
    color: crimson;
}


        </style>
<body>
    <form id="form1" runat="server">
            <nav id="home" class="navbar">  
        <div class="name">
            <ul>
                <li><a href="">Ride Sharing</a></li>
            </ul>
        </div>
        <div class="nav-menu">
            <ul>
                <li><a href="#Request">Request Ride</a></li>
                <li><a href="#profile">Edite profile</a></li>
                <li><a href="#history">History</a></li>
                <li><a href="#driver following">Driver Following</a></li>
                <li><a href="#delete Account">Delete Account</a></li>
                <li><a href="#support">Customer Support</a></li>
                <li><a href="#log out">Logout</a></li>
            </ul>
        </div>
             

    </form>
</body>
</html>
