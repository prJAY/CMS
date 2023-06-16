<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PasswordRecovery.aspx.vb" Inherits="Project_CMS.PasswordRecovery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Recover Password</title>
    <link href="CSS/PasswordRecovery.css" rel="stylesheet" type="text/css" />
    <link href="CSS/ImportFonts.css" rel="stylesheet" type="text/css" />
</head>
<body>
<form id="form1" runat="server" method="get">
    <nav class="logo">
        <h3><a href="Home.aspx">H7.CMS</a></h3>
    </nav>
    <div class="test">
    <div class="maincontainer">
        <asp:Panel ID="PanelStep1" runat="server">
            <div class="step1">
                <h3>Step 1 : Find your account</h3>
                <div class="divEmail">

                <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" AutoComplete="off" MaxLength="50"></asp:TextBox>
                <asp:Label ID="lblEmail" runat="server" CssClass="label">
                    <span>E-mail Address</span>
                </asp:Label>
                <asp:RequiredFieldValidator ID="RFEmail" runat="server" ErrorMessage="Enter an email" ControlToValidate="txtEmail" ForeColor="Red" EnableClientScript="False" Font-Size="Small" Display="Dynamic" ValidationGroup="GroupStep1"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="validEmail" runat="server" ErrorMessage="Enter a valid email" ControlToValidate="txtEmail" EnableClientScript="False" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" Font-Size="Small" ValidationGroup="GroupStep1"></asp:RegularExpressionValidator>

                </div>
                <asp:Label ID="lblErrorMsg1" runat="server" CssClass="ErrorMSG" Text=""></asp:Label>
                <asp:Button ID="btNext1" runat="server" Text="Next" ValidationGroup="GroupStep1" />
            </div>
        </asp:Panel>
        <asp:Panel ID="PanelStep2" runat="server">
            <div class="step2">

                <h3>Step 2 : Answer security question</h3>
                <div class="divSAns">

                <asp:TextBox ID="txtAns" runat="server" CssClass="textbox" AutoComplete="off" MaxLength="20"></asp:TextBox>
                <asp:Label ID="lblSQAns" runat="server" CssClass="label">
                    <span>Question will appear here</span>
                </asp:Label>
                <asp:RequiredFieldValidator ID="RFSAns" runat="server" ErrorMessage="Enter an answer" ControlToValidate="txtAns" ForeColor="Red" EnableClientScript="False" Font-Size="Small" ValidationGroup="GroupStep2"></asp:RequiredFieldValidator>
            </div>
            <asp:Label ID="lblErrorMsg2" runat="server" CssClass="ErrorMSG" Text=""></asp:Label>
            <asp:Button ID="btNext2" runat="server" Text="Next" ValidationGroup="GroupStep2" />

            </div>
        </asp:Panel>
        <asp:Panel ID="PanelStep3" runat="server">
            <div class="step3">

                <h3>Step 3 : Create Password</h3>
                <div class="divPass">

                    <asp:TextBox ID="txtPass" runat="server" CssClass="textbox" TextMode="Password" MaxLength="20"></asp:TextBox>
                    <asp:Label ID="lblPass" runat="server" CssClass="label">
                        <span>Create a new password</span>
                    </asp:Label>
                    <asp:RequiredFieldValidator ID="RFPass" runat="server" ErrorMessage="Enter a password" ControlToValidate="txtPass" ForeColor="Red" EnableClientScript="False" Font-Size="Small" ValidationGroup="GroupStep3"></asp:RequiredFieldValidator>

                </div>
                <div class="divRePass">

                    <asp:TextBox ID="txtRePass" runat="server" CssClass="textbox" Textmode="Password" MaxLength="20"></asp:TextBox>
                    <asp:Label ID="lblRepass" runat="server" CssClass="label">
                        <span>Confirm Password</span>
                    </asp:Label>
                    <asp:RequiredFieldValidator ID="RFRePass" runat="server" ErrorMessage="Confirm password again" ControlToValidate="txtRePass" ForeColor="Red" EnableClientScript="False" Font-Size="Small" Display="Dynamic" ValidationGroup="GroupStep3"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="COMRePass" runat="server" ErrorMessage="Both password must be same" ForeColor="Red" EnableClientScript="False" Font-Size="Small" ControlToCompare="txtPass" ControlToValidate="txtRePass" ValidationGroup="GroupStep3"></asp:CompareValidator>
                </div>
                <asp:Button ID="BtChange" runat="server" Text="Change" ValidationGroup="GroupStep3"/>
            </div>
        </asp:Panel>
    </div>
    </div>
    </form>
</body>
</html>