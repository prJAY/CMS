Public Class MainApp
    Inherits System.Web.UI.MasterPage

    Protected Sub btAdd_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btAdd.Click
        Response.Redirect("AddNew.aspx")
    End Sub

End Class