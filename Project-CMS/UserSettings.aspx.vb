Imports System.Data.SqlClient
Public Class UserSettings
    Inherits System.Web.UI.Page
    Dim crypt As New Cryptos
    ReadOnly con As New SqlConnection(crypt.connect_str)
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim str As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UID") = Nothing Then
            Response.Redirect("Login.aspx")
        ElseIf Not IsPostBack Then
            str = "select FirstName,LastName,Email,MobileNo from CMS_Users where UserId = @UID;"
            cmd = New SqlCommand(str, con)
            cmd.Parameters.AddWithValue("@UID", Session("UID"))
            If con.State = Data.ConnectionState.Closed Then
                con.Open()
            End If
            dr = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()
                txtFirst.Text = dr(0)
                txtLast.Text = dr(1)
                txtEmail.Text = crypt.DecryptData(dr(2))
                txtPhone.Text = dr(3)
            End If
            dr.Close()
            con.Close()
        End If
    End Sub

    Protected Sub btSave_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btSave.Click
        If Page.IsValid Then
            str = "update CMS_Users set FirstName = @FirstName , LastName = @LastName , Email = @Email ,MobileNo = @MobileNo where UserID = @UID;"
            cmd = New SqlCommand(str, con)
            With cmd.Parameters
                .AddWithValue("@Firstname", txtFirst.Text)
                .AddWithValue("@Lastname", txtLast.Text)
                .AddWithValue("@Email", crypt.EncryptData(LCase(txtEmail.Text)))
                .AddWithValue("@MobileNo", txtPhone.Text)
                .AddWithValue("@UID", Session("UID"))
            End With
            If con.State = Data.ConnectionState.Closed Then
                con.Open()
            End If
            cmd.ExecuteNonQuery()
            con.Close()
            ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('Details Saved Successfully')", True)
        End If
    End Sub

    Protected Sub btChange_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btChange.Click
        If Page.IsValid And crypt.CMS_Valid(txtPass.Text) Then
            If con.State = Data.ConnectionState.Closed Then
                con.Open()
            End If
            str = "select UserId from CMS_Users where UserId = @UID and Password1 = @Password;"
            cmd = New SqlCommand(str, con)
            cmd.Parameters.AddWithValue("@UID", Session("UID"))
            cmd.Parameters.AddWithValue("@Password", crypt.EncryptData(txtOldPass.Text))
            dr = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Close()
                str = "update CMS_Users set Password1 = @Password where UserID = @UID and Password1 = @OldPassword;"
                cmd = New SqlCommand(str, con)
                With cmd.Parameters
                    .AddWithValue("@OldPassword", crypt.EncryptData(txtOldPass.Text))
                    .AddWithValue("@Password", crypt.EncryptData(txtPass.Text))
                    .AddWithValue("@UID", Session("UID"))
                End With
                cmd.ExecuteNonQuery()
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('Password changed successfully')", True)
                txtOldPass.Text = ""
                txtPass.Text = ""
                txtRePass.Text = ""
            Else
                dr.Close()
                lblErrorMsg.Text = "Password is incorrect"
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

    Protected Sub btDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btDelete.Click
        If Page.IsValid Then
            If con.State = Data.ConnectionState.Closed Then
                con.Open()
            End If
            str = "select UserId from CMS_Users where UserId = @UID and Password1 = @Password;"
            cmd = New SqlCommand(str, con)
            cmd.Parameters.AddWithValue("@UID", Session("UID"))
            cmd.Parameters.AddWithValue("@Password", crypt.EncryptData(txtdeletePass.Text))
            dr = cmd.ExecuteReader
            If dr.HasRows Then
                If MsgBox("YOU ARE ABOUT TO DELETE THIS ACCOUNT.DO YOU WANT TO CONTINUE ?", MsgBoxStyle.YesNo, "Attention !") = MsgBoxResult.Yes Then
                    dr.Close()

                    str = "delete from CMS_Cards where UserID = @UID;"
                    cmd = New SqlCommand(str, con)
                    cmd.Parameters.AddWithValue("@UID", Session("UID"))
                    cmd.ExecuteNonQuery()

                    str = "delete from CMS_Documents where UserID = @UID;"
                    cmd = New SqlCommand(str, con)
                    cmd.Parameters.AddWithValue("@UID", Session("UID"))
                    cmd.ExecuteNonQuery()

                    str = "delete from CMS_Passwords where UserID = @UID;"
                    cmd = New SqlCommand(str, con)
                    cmd.Parameters.AddWithValue("@UID", Session("UID"))
                    cmd.ExecuteNonQuery()

                    cmd.ExecuteNonQuery()
                    str = "delete from CMS_Users where UserID = @UID and Password1 = @OldPassword;"
                    cmd = New SqlCommand(str, con)
                    With cmd.Parameters
                        .AddWithValue("@OldPassword", crypt.EncryptData(txtdeletePass.Text))
                        .AddWithValue("@UID", Session("UID"))
                    End With
                    cmd.ExecuteNonQuery()
                    con.Close()
                    MsgBox("Account deleted successfully", MsgBoxStyle.OkOnly, "CMS")
                    Response.Redirect("AccountSuccess.htm")
                Else
                    lbl.Text = "ACCOUNT DELETION ABORTED"
                End If
            Else
                lbl.Text = "Incorrect Password"
            End If
            dr.Close()
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