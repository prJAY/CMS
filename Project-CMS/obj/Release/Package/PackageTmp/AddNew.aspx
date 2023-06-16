<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MainApp.Master" CodeBehind="AddNew.aspx.vb" Inherits="Project_CMS.AddNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPH_link" runat="server">

        <link href="CSS/AddNew.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH_content" runat="server">
<div class="MainContainerAdd">
    <div class="Catagory">
        <asp:Label ID="lbCatagory" runat="server" Text="Select Catagory"></asp:Label>
        <asp:DropDownList ID="ddCatagory" runat="server" AutoPostBack="True">
            <asp:ListItem>Password</asp:ListItem>
            <asp:ListItem>Card</asp:ListItem>
            <asp:ListItem>Document</asp:ListItem>
        </asp:DropDownList>
    </div>
    <asp:Panel ID="panelPass" runat="server">
        <table>
            <tr>
                <td>Name</td>
                <td><asp:TextBox ID="txtName" runat="server" MaxLength="30"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RF1" runat="server" ErrorMessage="Required" ControlToValidate="txtName" EnableClientScript="False" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>URL</td>
                <td><asp:TextBox ID="txtURL" runat="server" MaxLength="50"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RF2" runat="server" ErrorMessage="Required" ControlToValidate="txtURL" EnableClientScript="False" Font-Size="Small" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="Reg1" runat="server" ControlToValidate="txtURL" EnableClientScript="False" ErrorMessage="Enter valid url" Font-Size="Small" ForeColor="Red" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Username</td>
                <td><asp:TextBox ID="txtUser" runat="server" AutoComplete="off"  MaxLength="50"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RF3" runat="server" ErrorMessage="Required" ControlToValidate="txtUser" EnableClientScript="False" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><asp:TextBox ID="txtPass" runat="server" TextMode="Password"   AutoComplete="off"  MaxLength="20"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RF4" runat="server" ErrorMessage="Required" ControlToValidate="txtPass" EnableClientScript="False" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Notes</td>
                <td colspan="2"><asp:TextBox ID="txtNotes" runat="server" MaxLength="100" TextMode="MultiLine"></asp:TextBox></td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Panel ID="panelCard" runat="server">
        <table>
            <tr>
                <td>Name on Card</td>
                <td>
                    <asp:TextBox ID="txtCardName" runat="server" AutoComplete="off"  MaxLength="50"></asp:TextBox>
                </td>
                <td><asp:RequiredFieldValidator ID="RF5" runat="server" ErrorMessage="Required" ControlToValidate="txtCardName" EnableClientScript="False" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Card Type</td>
                <td>
                    <asp:DropDownList ID="ddCardType" runat="server">
                        <asp:ListItem>Debit Card</asp:ListItem>
                        <asp:ListItem>Credit Card</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>Number</td>
                <td><asp:TextBox ID="txtCardNo" runat="server" AutoComplete="off" MaxLength="16"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RF6" runat="server" ErrorMessage="Required" ControlToValidate="txtCardNo" EnableClientScript="False" Font-Size="Small" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter a valid number without any characters" ControlToValidate="txtCardNo" EnableClientScript="False" Font-Size="Small" ForeColor="Red" ValidationExpression="\d{16}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Valid Through</td>
                <td>
                    <asp:DropDownList ID="ddEndDate" runat="server">
                        <asp:ListItem>01</asp:ListItem>
                        <asp:ListItem>02</asp:ListItem>
                        <asp:ListItem>03</asp:ListItem>
                        <asp:ListItem>04</asp:ListItem>
                        <asp:ListItem>05</asp:ListItem>
                        <asp:ListItem>06</asp:ListItem>
                        <asp:ListItem>07</asp:ListItem>
                        <asp:ListItem>08</asp:ListItem>
                        <asp:ListItem>09</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="txtEndYear" runat="server" MaxLength="4"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RF9" runat="server" ErrorMessage="Required" ControlToValidate="txtEndYear" EnableClientScript="False" Font-Size="Small" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CS3" runat="server" ControlToValidate="txtEndYear" EnableClientScript="False" ErrorMessage="Enter valid year" Font-Size="Small" ForeColor="Red"></asp:CustomValidator>
                </td>
            </tr>
        </table>
    </asp:Panel>

     <asp:Panel ID="panelDoc" runat="server">
        <table>
            <tr>
                <td>Document Type</td>
                <td><asp:TextBox ID="txtDocType" runat="server" MaxLength="20"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="R10" runat="server" ErrorMessage="Required" ControlToValidate="txtDocType" EnableClientScript="False" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Name on Document</td>
                <td><asp:TextBox ID="txtDocName" runat="server"  AutoComplete="off"  MaxLength="50"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RF11" runat="server" ErrorMessage="Required" ControlToValidate="txtDocName" EnableClientScript="False" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Document Number</td>
                <td><asp:TextBox ID="txtDocNo" runat="server"  AutoComplete="off"  MaxLength="30"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RF12" runat="server" ErrorMessage="Required" ControlToValidate="txtDocNo" EnableClientScript="False" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Additional Notes</td>
                <td colspan="2"><asp:TextBox ID="txtDocNotes" runat="server" MaxLength="100" TextMode="MultiLine"></asp:TextBox></td>
            </tr>
        </table>
    </asp:Panel>

    <div class="buttons">
        <asp:Button ID="btSave" runat="server" Text="Save" />
        <asp:Button ID="btClear" type="reset" runat="server" Text="Clear" CausesValidation="False" />
    </div>
    </div>
</asp:Content>