Partial Class Home
    Inherits System.Web.UI.Page
    Protected Sub BtLogin_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BtLogin.Click
        Response.Redirect("Login.aspx")
    End Sub

    Protected Sub BtSign_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BtSign.Click
        Response.Redirect("SignUp.aspx")
    End Sub
End Class
