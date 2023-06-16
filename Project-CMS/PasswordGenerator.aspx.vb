Public Class PasswordGenerator
    Inherits System.Web.UI.Page

    Dim pool As String = ""
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UID") = Nothing Then
            Response.Redirect("Login.aspx")
        End If
        If txtLength.Text = "" Then
            txtLength.Text = 8
        End If
    End Sub

    Protected Sub btGenerate_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btGenerate.Click
        If Page.IsValid Then

            If cb1.Checked = False And cb2.Checked = False And cb3.Checked = False And cb4.Checked = False Then
                cb2.Checked = True
                cb3.Checked = True
            ElseIf cb1.Checked = False And cb2.Checked = False And cb3.Checked = False And cb4.Checked = True Then
                cb2.Checked = True
            End If

            If cb1.Checked Then
                pool += "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
            End If
            If cb2.Checked Then
                pool += "abcdefghijklmnopqrstuvwxyz"
            End If
            If cb3.Checked Then
                pool += "0123456789"
            End If
            If cb4.Checked Then
                pool += "!@#$%&*?"
            End If


            Dim cc As New Random
            Dim strpos = ""
            txtPass.Value = ""

            For i = 0 To Val(txtLength.Text) - 1
                strpos = cc.Next(0, pool.Length)
                txtPass.Value += pool(strpos)
            Next

            pool = ""
        End If
    End Sub
End Class