<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="PaymentCard.ascx.vb" Inherits="Project_CMS.PaymentCard" %>
<div class="BodyCard" runat="server" id="body">

    <asp:Label ID="lblTopLeft" runat="server" Text="HOTSPOT7" CssClass="TopLeft"></asp:Label>
    <asp:Label ID="lblTopRight" runat="server" Text="Credit Card" CssClass="TopRight"></asp:Label>
    <asp:Label ID="lblCenter" runat="server" Text="" CssClass="CenterPay"></asp:Label>
    <asp:Label ID="lblBottomLeft" runat="server" Text="" CssClass="BottomLeft"></asp:Label>
    <asp:Label ID="lblBottomRight" runat="server" Text="CMS" CssClass="BottomRight"></asp:Label>

    <asp:Button ID="btView" runat="server" Text="View" cssClass="ViewLink"/>

</div>