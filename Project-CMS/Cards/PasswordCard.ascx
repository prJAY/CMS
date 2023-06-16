<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="PasswordCard.ascx.vb" Inherits="Project_CMS.PasswordCard" %>
<div class="BodyCard" style="background : url(../Images/PasswordBG.png); background-size:cover;">

    <asp:Label ID="lblTopLeft" runat="server" Text="HOTSPOT7" CssClass="TopLeft"></asp:Label>
    <asp:Label ID="lblTopRight" runat="server" Text="Password" CssClass="TopRight"></asp:Label>
    <asp:Label ID="lblCenter" runat="server" Text="" CssClass="CenterPass"></asp:Label>
    <asp:Label ID="lblBottomLeft" runat="server" Text="" CssClass="BottomLeft"></asp:Label>
    <asp:Label ID="lblBottomRight" runat="server" Text="CMS" CssClass="BottomRight"></asp:Label>

    <asp:Button ID="btView" runat="server" Text="View" cssClass="ViewLink"/>

</div>
