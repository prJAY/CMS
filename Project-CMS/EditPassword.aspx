<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MainApp.Master" CodeBehind="EditPassword.aspx.vb" Inherits="Project_CMS.EditPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPH_link" runat="server">

    <link href="CSS/EditItems.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH_content" runat="server">
    <div class="MainContainerEdit">
                <h2 class="headline">Edit Password</h2>
        <asp:Panel ID="panelPass" runat="server">
        <table>
            <tr>
                <td>Name</td>
                <td><asp:TextBox ID="txtName" runat="server" MaxLength="20"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RF1" runat="server" ErrorMessage="Required" ControlToValidate="txtName" EnableClientScript="False" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>URL</td>
                <td><asp:TextBox ID="txtURL" runat="server" MaxLength="50"></asp:TextBox></td>
                <td>
                    <asp:Button ID="btVisit" runat="server" Text="Visit" />
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
                <td><asp:TextBox ID="txtPass" runat="server" AutoComplete="off"  MaxLength="20"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RF4" runat="server" ErrorMessage="Required" ControlToValidate="txtPass" EnableClientScript="False" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Notes</td>
                <td colspan="2"><asp:TextBox ID="txtNotes" runat="server" MaxLength="50" TextMode="MultiLine"></asp:TextBox></td>
            </tr>
        </table>
    </asp:Panel>

        <asp:Button ID="btSave" runat="server" Text="Save" />
        <asp:Button ID="btDelete" runat="server" Text="Delete" />

    </div>
</asp:Content>
