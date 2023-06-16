<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SignUp.aspx.vb" Inherits="Project_CMS.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Get Started</title>
    <link href="CSS/SignUp.css" rel="stylesheet" type="text/css" />
    <link href="CSS/ImportFonts.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat="server">
    <nav class="logo">
        <h3><a href="Home.aspx">H7.CMS</a></h3>
    </nav>
    <div class="test">
    <div class="maincontainer">
         <h3 class="headline">Sign Up , As easy as 1.2.3..</h3>

        <div class="divFirst">

            <asp:TextBox ID="txtFirst" runat="server" CssClass="textbox" AutoComplete="off" MaxLength="20"></asp:TextBox>
            <asp:Label ID="lblFirst" runat="server" CssClass="label">
                <span>First Name</span>
            </asp:Label>
            <asp:RequiredFieldValidator ID="RFFirst" runat="server" ErrorMessage="Enter First Name" ControlToValidate="txtFirst" ForeColor="Red" EnableClientScript="False" Font-Size="Small"></asp:RequiredFieldValidator>

        </div>
        <div class="divLast">

            <asp:TextBox ID="txtLast" runat="server" CssClass="textbox" AutoComplete="off"  MaxLength="20"></asp:TextBox>
            <asp:Label ID="lblLast" runat="server" CssClass="label">
                <span>Last Name</span>
            </asp:Label>
            <asp:RequiredFieldValidator ID="RFLast" runat="server" ErrorMessage="Enter Last Name" ControlToValidate="txtLast" ForeColor="Red" EnableClientScript="False" Font-Size="Small"></asp:RequiredFieldValidator>
        
        </div>

        <div class="divEmail">

            <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" AutoComplete="off"  MaxLength="50"></asp:TextBox>
            <asp:Label ID="lblEmail" runat="server" CssClass="label">
                <span>E-mail Address</span>
            </asp:Label>
            <asp:RequiredFieldValidator ID="RFEmail" runat="server" ErrorMessage="Enter an email" ControlToValidate="txtEmail" ForeColor="Red" EnableClientScript="False" Font-Size="Small" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="validEmail" runat="server" ErrorMessage="Enter a valid email" ControlToValidate="txtEmail" EnableClientScript="False" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" Font-Size="Small"></asp:RegularExpressionValidator>

        </div>
        <div class="divPhone">

            <asp:TextBox ID="txtPhone" runat="server" CssClass="textbox" AutoComplete="off"  MaxLength="10"></asp:TextBox>
            <asp:Label ID="Label1" runat="server" CssClass="label">
                <span>Mobile No</span>
            </asp:Label>
            <asp:RequiredFieldValidator ID="REPhone" runat="server" ErrorMessage="Enter a mobile number" ControlToValidate="txtPhone" ForeColor="Red" EnableClientScript="False" Font-Size="Small" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="validPhone" runat="server" ErrorMessage="Enter a valid number" ControlToValidate="txtPhone" EnableClientScript="False" ValidationExpression="\d{10}" ForeColor="Red" Font-Size="Small"></asp:RegularExpressionValidator>

        </div>
        
        <div class="divPass">

            <asp:TextBox ID="txtPass" runat="server" CssClass="textbox" TextMode="Password"  MaxLength="20"></asp:TextBox>
            <asp:Label ID="lblPass" runat="server" CssClass="label">
                <span>Create a Password</span>
            </asp:Label>
            <asp:RequiredFieldValidator ID="RFPass" runat="server" ErrorMessage="Enter a password" ControlToValidate="txtPass" ForeColor="Red" EnableClientScript="False" Font-Size="Small"></asp:RequiredFieldValidator>
        </div>
        <div class="divRePass">

            <asp:TextBox ID="txtRePass" runat="server" CssClass="textbox" TextMode="Password"  MaxLength="20"></asp:TextBox>
            <asp:Label ID="lblRepass" runat="server" CssClass="label">
                <span>Confirm Password</span>
            </asp:Label>
            <asp:RequiredFieldValidator ID="RFRePass" runat="server" ErrorMessage="Confirm password again" ControlToValidate="txtRePass" ForeColor="Red" EnableClientScript="False" Font-Size="Small" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="COMRePass" runat="server" ErrorMessage="Both password must be same" ForeColor="Red" EnableClientScript="False" Font-Size="Small" ControlToCompare="txtPass" ControlToValidate="txtRePass"></asp:CompareValidator>
        </div>

        <div class="divSQ">

            <asp:TextBox ID="txtSQ" runat="server" CssClass="textbox" AutoComplete="off"  MaxLength="50"></asp:TextBox>
            <asp:Label ID="lblSQ" runat="server" CssClass="label">
                <span>Security Question</span>
            </asp:Label>
            <asp:RequiredFieldValidator ID="RFSQ" runat="server" ErrorMessage="Enter a question" ControlToValidate="txtSQ" ForeColor="Red" EnableClientScript="False" Font-Size="Small"></asp:RequiredFieldValidator>

        </div>
        <div class="divSAns">

            <asp:TextBox ID="txtAns" runat="server" CssClass="textbox" AutoComplete="off"  MaxLength="20"></asp:TextBox>
            <asp:Label ID="lblSAns" runat="server" CssClass="label">
                <span>Answer</span>
            </asp:Label>
            <asp:RequiredFieldValidator ID="RFSAns" runat="server" ErrorMessage="Enter an answer" ControlToValidate="txtAns" ForeColor="Red" EnableClientScript="False" Font-Size="Small"></asp:RequiredFieldValidator>
        
        </div>

        <div class="divActions">

            <asp:Label ID="lblErrorMSG" runat="server" CssClass="ErrorMSG" Text=""></asp:Label>
            <asp:Button ID="btSign" runat="server" Text="Sign Up" />
                <span class="spanlink">Already have an account?
                <a href="Login.aspx">Log In</a></span>

        </div>
    </div>
    </div>
    </form>
</body>
</html>