<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MainApp.Master" CodeBehind="ItemCards.aspx.vb" Inherits="Project_CMS.ItemCards" %>
<%@ Register Src="~/Cards/PaymentCard.ascx" TagPrefix="Card" TagName="PaymentCard" %>
<%@ Register Src="~/Cards/PasswordCard.ascx" TagPrefix="Card" TagName="PasswordCard" %>
<%@ Register Src="~/Cards/DocumentCard.ascx" TagPrefix="Card" TagName="DocumentCard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH_link" runat="server">

    <link href="CSS/ItemCards.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH_content" runat="server">
    <div class="MainContainerItems">
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        <asp:Panel ID="Panel1" runat="server">
            <asp:Label ID="Label1" runat="server" Text="Click on"></asp:Label>
            <asp:Button ID="Button1" runat="server" Text="+ Add New" />
            <asp:Label ID="Label2" runat="server" Text="Button to save credentials"></asp:Label>
            <asp:Label ID="Label3" runat="server" Text="Once you save anything, it will appear here"></asp:Label>
        </asp:Panel>
    </div>
</asp:Content>