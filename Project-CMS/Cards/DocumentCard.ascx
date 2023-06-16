<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="DocumentCard.ascx.vb" Inherits="Project_CMS.DocumentCard" %>
<div class="BodyCard" style="background : url(../Images/DocumentBG.png); background-size:cover;">

    <asp:Label ID="lblTopLeft" runat="server" Text="HOTSPOT7" CssClass="TopLeft"></asp:Label>
    <asp:Label ID="lblTopRight" runat="server" Text="" CssClass="TopRight"></asp:Label>
    <asp:Label ID="lblCenter" runat="server" Text="" CssClass="CenterDoc"></asp:Label>
    <asp:Label ID="lblBottomLeft" runat="server" Text="" CssClass="BottomLeft"></asp:Label>
    <asp:Label ID="lblBottomRight" runat="server" Text="CMS" CssClass="BottomRight"></asp:Label>

    <asp:Button ID="btView" runat="server" Text="View" cssClass="ViewLink"/>

</div>