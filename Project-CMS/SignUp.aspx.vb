Imports System.Data.SqlClient
Public Class SignUp
    Inherits System.Web.UI.Page
    Dim crypt As New Cryptos
    ReadOnly con As New SqlConnection(crypt.connect_str)
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim str As String
    Protected Sub btSign_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btSign.Click
        If Page.IsValid And crypt.CMS_Valid(txtPass.Text) Then
            str = "select LastName from CMS_Users where email=@Email;"
            cmd = New SqlCommand(str, con)
            cmd.Parameters.AddWithValue("@Email", crypt.EncryptData(LCase(txtEmail.Text)))
            If con.State = Data.ConnectionState.Closed Then
                con.Open()
            End If
            dr = cmd.ExecuteReader()
            If dr.HasRows Then
                lblErrorMSG.Text = "Email id already exist"
                dr.Close()
            Else
                dr.Close()
                str = "insert into CMS_Users(FirstName,LastName,Email,MobileNo,Password1,SecurityQue,SecurityAns)values(@FirstName,@LastName,@Email,@MobileNo,@Password,@SecurityQue,@SecurityAns);"
                cmd = New SqlCommand(str, con)
                With cmd.Parameters
                    .AddWithValue("@FirstName", txtFirst.Text)
                    .AddWithValue("@LastName", txtLast.Text)
                    .AddWithValue("@Email", crypt.EncryptData(LCase(txtEmail.Text)))
                    .AddWithValue("@MobileNo", txtPhone.Text)
                    .AddWithValue("@Password", crypt.EncryptData(txtPass.Text))
                    .AddWithValue("@SecurityQue", txtSQ.Text)
                    .AddWithValue("@SecurityAns", crypt.EncryptData(txtAns.Text))
                End With
                cmd.ExecuteNonQuery()
                con.Close()
                Response.Redirect("AccountSuccess.htm", True)
            End If
            con.Close()
        ElseIf Page.IsValid And crypt.CMS_Valid(txtPass.Text) = False Then
            Dim str As String = "alert('"
            str += "A valid password must have\n"
            str += "atleast 1 Capital letter\n"
            str += "atleast 1 Small letter\n"
            str += "atleast 1 number\n"
            str += "alteast 1 special character\n"
            str += "minimum 8 characters long')"
            ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", str, True)
        End If
    End Sub
End Class