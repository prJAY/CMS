<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MainApp.Master" CodeBehind="UserSettings.aspx.vb" Inherits="Project_CMS.UserSettings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPH_link" runat="server">
    <link href="CSS/UserSettings.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH_content" runat="server">

    <div class="Settingscontainer">
    <div class="Card1">
        <span class="title">Change account details</span>

        <div class="divFirst">

            <asp:TextBox ID="txtFirst" runat="server" CssClass="textbox" AutoComplete="off"  MaxLength="20"></asp:TextBox>
            <asp:Label ID="lblFirst" runat="server" CssClass="label">
                <span>First Name</span>
            </asp:Label>
            <asp:RequiredFieldValidator ID="RFFirst" runat="server" ErrorMessage="Enter First Name" ControlToValidate="txtFirst" ForeColor="Red" EnableClientScript="False" Font-Size="Small" ValidationGroup="GroupAccountDetails"></asp:RequiredFieldValidator>

        </div>
        <div class="divLast">

            <asp:TextBox ID="txtLast" runat="server" CssClass="textbox" AutoComplete="off"  MaxLength="20"></asp:TextBox>
            <asp:Label ID="lblLast" runat="server" CssClass="label">
                <span>Last Name</span>
            </asp:Label>
            <asp:RequiredFieldValidator ID="RFLast" runat="server" ErrorMessage="Enter Last Name" ControlToValidate="txtLast" ForeColor="Red" EnableClientScript="False" Font-Size="Small" ValidationGroup="GroupAccountDetails"></asp:RequiredFieldValidator>
        
        </div>
        <div class="divEmail">

            <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" AutoComplete="off"  MaxLength="50"></asp:TextBox>
            <asp:Label ID="lblEmail" runat="server" CssClass="label">
                <span>E-mail Address</span>
            </asp:Label>
            <asp:RequiredFieldValidator ID="RFEmail" runat="server" ErrorMessage="Enter an email" ControlToValidate="txtEmail" ForeColor="Red" EnableClientScript="False" Font-Size="Small" Display="Dynamic" ValidationGroup="GroupAccountDetails"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="validEmail" runat="server" ErrorMessage="Enter a valid email" ControlToValidate="txtEmail" EnableClientScript="False" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red" Font-Size="Small" ValidationGroup="GroupAccountDetails"></asp:RegularExpressionValidator>

        </div>
        <div class="divPhone">

            <asp:TextBox ID="txtPhone" runat="server" CssClass="textbox" AutoComplete="off"  MaxLength="10"></asp:TextBox>
            <asp:Label ID="Label1" runat="server" CssClass="label">
                <span>Mobile No</span>
            </asp:Label>
            <asp:RequiredFieldValidator ID="REPhone" runat="server" ErrorMessage="Enter a mobile number" ControlToValidate="txtPhone" ForeColor="Red" EnableClientScript="False" Font-Size="Small" Display="Dynamic" ValidationGroup="GroupAccountDetails"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="validPhone" runat="server" ErrorMessage="Enter a valid number" ControlToValidate="txtPhone" EnableClientScript="False" ValidationExpression="\d{10}" ForeColor="Red" Font-Size="Small" ValidationGroup="GroupAccountDetails"></asp:RegularExpressionValidator>

        </div>
        <div class="divSave">
            <asp:Button ID="btSave" runat="server" Text="Save" ValidationGroup="GroupAccountDetails" />
        </div>
    </div>
    <div class="card2">
        <span class="title2">Change account password</span>
        <div class="divOldPass">

            <asp:TextBox ID="txtOldPass" runat="server" CssClass="textbox"  AutoComplete="off" textmode="Password" MaxLength="20"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" CssClass="label">
                <span>Enter current password *</span>
            </asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter a password" ControlToValidate="txtOldPass" ForeColor="Red" EnableClientScript="False" Font-Size="Small" ValidationGroup="GroupAccountPass"></asp:RequiredFieldValidator>

        </div>
        <div class="divPass">

            <asp:TextBox ID="txtPass" runat="server" CssClass="textbox"  AutoComplete="off" textmode="Password" MaxLength="20"></asp:TextBox>
            <asp:Label ID="lblPass" runat="server" CssClass="label">
                <span>Create a new password *</span>
            </asp:Label>
            <asp:RequiredFieldValidator ID="RFPass" runat="server" ErrorMessage="Enter a password" ControlToValidate="txtPass" ForeColor="Red" EnableClientScript="False" Font-Size="Small" ValidationGroup="GroupAccountPass"></asp:RequiredFieldValidator>

        </div>
        <div class="divRePass">

            <asp:TextBox ID="txtRePass" runat="server" CssClass="textbox"  AutoComplete="off" textmode="Password" MaxLength="20"></asp:TextBox>
            <asp:Label ID="lblRepass" runat="server" CssClass="label">
                <span>Confirm new Password *</span>
            </asp:Label>
            <asp:RequiredFieldValidator ID="RFRePass" runat="server" ErrorMessage="Confirm password again" ControlToValidate="txtRePass" ForeColor="Red" EnableClientScript="False" Font-Size="Small" Display="Dynamic" ValidationGroup="GroupAccountPass"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="COMRePass" runat="server" ErrorMessage="Both password must be same" ForeColor="Red" EnableClientScript="False" Font-Size="Small" ControlToCompare="txtPass" ControlToValidate="txtRePass" ValidationGroup="GroupAccountPass"></asp:CompareValidator>
        </div>

        <div class="divChange">
            <asp:Label ID="lblErrorMsg" runat="server" CssClass="ErrorMSG" Text=""></asp:Label>
            <asp:Button ID="btChange" runat="server" Text="Change" ValidationGroup="GroupAccountPass" />
        </div>
    </div>
    <div class="card3">
        <span class="title3">Permenetly delete account</span>
        <div class="divDelPass">

            <asp:TextBox ID="txtdeletePass" runat="server" CssClass="textbox"  AutoComplete="off" textmode="Password" MaxLength="20"></asp:TextBox>
            <asp:Label ID="lbldelpass" runat="server" CssClass="label">
                <span>Enter current password *</span>
            </asp:Label>
            <asp:RequiredFieldValidator ID="RFDelPass" runat="server" ErrorMessage="Enter a password" ControlToValidate="txtdeletePass" ForeColor="Red" EnableClientScript="False" Font-Size="Small" ValidationGroup="DelAccount"></asp:RequiredFieldValidator>

        </div>
        <div class="divDelete">
            <asp:Label ID="lbl" runat="server" CssClass="ErrorMSGDel" Text=""></asp:Label>
            <asp:Button ID="btDelete" runat="server" Text="Delete" ValidationGroup="DelAccount" />
        </div>
    </div>
    </div>

</asp:Content>
