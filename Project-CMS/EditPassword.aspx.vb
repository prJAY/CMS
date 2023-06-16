Imports System.Data.SqlClient
Public Class EditPassword
    Inherits System.Web.UI.Page
    Dim crypt As New Cryptos
    ReadOnly con As New SqlConnection(crypt.connect_str)
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim str As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Pass_Load_ID") = Nothing Then
            Response.Redirect("ItemCards.aspx")
        ElseIf Not IsPostBack Then
            If con.State = Data.ConnectionState.Closed Then
                con.Open()
            End If
            str = "select * from CMS_Passwords where PID=@PID;"
            cmd = New SqlCommand(str, con)
            cmd.Parameters.AddWithValue("@PID", Session("Pass_Load_ID"))
            dr = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()
                txtName.Text = dr(2)
                txtURL.Text = dr(3)
                txtUser.Text = crypt.DecryptData(dr(4))
                txtPass.Text = crypt.DecryptData(dr(5))
                txtNotes.Text = dr(6)
            End If
            dr.Close()
            con.Close()
        End If
    End Sub

    Protected Sub btSave_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btSave.Click
        If Page.IsValid Then
            If con.State = Data.ConnectionState.Closed Then
                con.Open()
            End If
            If txtNotes.Text = "" Then
                txtNotes.Text = " "
            End If
            str = "Update CMS_Passwords set P_Name = @Name , P_URL = @URL , P_User = @User , P_Pass = @Pass, P_Notes = @Notes where PID = @PID"
            cmd = New SqlCommand(str, con)
            With cmd.Parameters
                .AddWithValue("@PID", Session("Pass_Load_ID"))
                .AddWithValue("@Name", txtName.Text)
                .AddWithValue("@URL", txtURL.Text)
                .AddWithValue("@User", crypt.EncryptData(txtUser.Text))
                .AddWithValue("@Pass", crypt.EncryptData(txtPass.Text))
                .AddWithValue("@Notes", txtNotes.Text)
            End With
            cmd.ExecuteNonQuery()
            ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('Details Saved Successfully')", True)
        End If
    End Sub

    Protected Sub btDelete_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btDelete.Click
        If MsgBox("Are you sure", MsgBoxStyle.YesNo, "CMS") = 6 Then
            If con.State = Data.ConnectionState.Closed Then
                con.Open()
            End If
            str = "delete from CMS_Passwords where PID = @PID"
            cmd = New SqlCommand(str, con)
            cmd.Parameters.AddWithValue("@PID", Session("Pass_Load_ID"))
            cmd.ExecuteNonQuery()
            MsgBox("Item Deleted Successfully", MsgBoxStyle.OkOnly, "CMS")
            Response.Redirect("ItemCards.aspx")
        End If
    End Sub

    Protected Sub btVisit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btVisit.Click
        Response.Redirect(txtURL.Text)
    End Sub
End Class