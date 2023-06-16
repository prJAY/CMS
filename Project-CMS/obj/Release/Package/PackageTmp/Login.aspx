<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="Project_CMS.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Secure Login</title>
    <link href="CSS/Login.css" rel="stylesheet" type="text/css" />
    <link href="CSS/ImportFonts.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat="server">
    <nav class="logo">
        <h3><a href="Home.aspx">H7.CMS</a></h3>
    </nav>
    <div class="test">
    <div class="MainContainer">

        <h3 class="headline">Login</h3>

        <div class="divEmail">

            <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" AutoComplete="off" MaxLength="50"></asp:TextBox>
            <asp:Label ID="lblEmail" runat="server" CssClass="label">
                <span>E-mail Address</span>
            </asp:Label>
            <asp:RequiredFieldValidator ID="RFEmail" runat="server" ErrorMessage="Enter an email" ControlToValidate="txtEmail" ForeColor="Red" EnableClientScript="False" Font-Size="Small" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="validEmail" runat="server" ErrorMessage="Enter a valid email" ControlToValidate="txtEmail" EnableClientScript="False" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" Font-Size="Small"></asp:RegularExpressionValidator>

        </div>
        <div class="divPass">

            <asp:TextBox ID="txtPass" runat="server" CssClass="textbox" TextMode="Password" MaxLength="20"></asp:TextBox>
            <asp:Label ID="lblPass" runat="server" CssClass="label">
                <span>Password</span>
            </asp:Label>
            <asp:RequiredFieldValidator ID="RFPass" runat="server" ErrorMessage="Enter a password" ControlToValidate="txtPass" ForeColor="Red" EnableClientScript="False" Font-Size="Small"></asp:RequiredFieldValidator>

        </div>
        <div class="divActions">

            <asp:Label ID="lblErrorMsg" runat="server" CssClass="ErrorMSG" Text=""></asp:Label>
            <a href="PasswordRecovery.aspx" class="linkForgot">Forgot Password?</a>
            <asp:Button ID="btLogin" runat="server" Text="Login" />
                <span class="spanlink">Don't have an account yet?
                <a href="SignUp.aspx">Create new</a></span>

        </div>
        </div>
    </div>
    </form>
</body>
</html>