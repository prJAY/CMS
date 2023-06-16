<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MainApp.Master" CodeBehind="EditDocument.aspx.vb" Inherits="Project_CMS.EditDocument" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPH_link" runat="server">

    <link href="CSS/EditItems.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH_content" runat="server">

    <div class="MainContainerEdit">
        <h2 class="headline">Edit Document</h2>
        <asp:Panel ID="panelDoc" runat="server">
        <table>
            <tr>
                <td>Document Type</td>
                <td><asp:TextBox ID="txtDocType" runat="server" MaxLength="15"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="R10" runat="server" ErrorMessage="Required" ControlToValidate="txtDocType" EnableClientScript="False" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Name on Document</td>
                <td><asp:TextBox ID="txtDocName" runat="server"  AutoComplete="off"  MaxLength="30"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RF11" runat="server" ErrorMessage="Required" ControlToValidate="txtDocName" EnableClientScript="False" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Document Number</td>
                <td><asp:TextBox ID="txtDocNo" runat="server"  AutoComplete="off"  MaxLength="30"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ID="RF12" runat="server" ErrorMessage="Required" ControlToValidate="txtDocNo" EnableClientScript="False" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Additional Notes</td>
                <td colspan="2"><asp:TextBox ID="txtDocNotes" runat="server" MaxLength="50" TextMode="MultiLine"></asp:TextBox></td>
            </tr>
        </table>
    </asp:Panel>

                <asp:Button ID="btSave" runat="server" Text="Save" />
        <asp:Button ID="btDelete" runat="server" Text="Delete" />

    </div>
</asp:Content>
