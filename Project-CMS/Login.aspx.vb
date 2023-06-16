Imports System.Data.SqlClient
Public Class Login
    Inherits System.Web.UI.Page
    Dim crypt As New Cryptos
    ReadOnly con As New SqlConnection(crypt.connect_str)
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim str As String
    Protected Sub btLogin_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btLogin.Click
        If Page.IsValid Then
            If con.State = Data.ConnectionState.Closed Then
                con.Open()
            End If
            str = "select UserId from CMS_Users where Email = @Email and Password1 = @Password;"
            cmd = New SqlCommand(str, con)
            cmd.Parameters.AddWithValue("@Email", crypt.EncryptData(LCase(txtEmail.Text)))
            cmd.Parameters.AddWithValue("@Password", crypt.EncryptData(txtPass.Text))

            dr = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()
                Session("UID") = dr(0)
                dr.Close()
                con.Close()
                Response.Redirect("ItemCards.aspx")
            Else
                lblErrorMsg.Text = "Email or Password incorrect"
            End If
            dr.Close()
            con.Close()
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Session("UID") = Nothing
    End Sub
End Class