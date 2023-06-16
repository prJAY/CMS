Imports System.Data.SqlClient
Public Class EditDocument
    Inherits System.Web.UI.Page
    Dim crypt As New Cryptos
    ReadOnly con As New SqlConnection(crypt.connect_str)
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim str As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Doc_Load_ID") = Nothing Then
            Response.Redirect("ItemCards.aspx")
        ElseIf Not IsPostBack Then
            If con.State = Data.ConnectionState.Closed Then
                con.Open()
            End If
            str = "select * from CMS_Documents where DID=@DID;"
            cmd = New SqlCommand(str, con)
            cmd.Parameters.AddWithValue("@DID", Session("Doc_Load_ID"))
            dr = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()
                txtDocType.Text = dr(2)
                txtDocName.Text = crypt.DecryptData(dr(3))
                txtDocNo.Text = crypt.DecryptData(dr(4))
                txtDocNotes.Text = dr(5)
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
            If txtDocNotes.Text = "" Then
                txtDocNotes.Text = " "
            End If
            str = "Update CMS_Documents set D_Name = @Name , D_Type = @Type,D_Number = @No,D_Notes = @Notes where DID = @DID"
            cmd = New SqlCommand(str, con)
            With cmd.Parameters
                .AddWithValue("@DID", Session("Doc_Load_ID"))
                .AddWithValue("@Name", crypt.EncryptData(txtDocName.Text))
                .AddWithValue("@Type", txtDocType.Text)
                .AddWithValue("@No", crypt.EncryptData(txtDocNo.Text))
                .AddWithValue("@Notes", txtDocNotes.Text)
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
            str = "delete from CMS_Documents where DID = @DID"
            cmd = New SqlCommand(str, con)
            cmd.Parameters.AddWithValue("@DID", Session("Doc_Load_ID"))
            cmd.ExecuteNonQuery()
            MsgBox("Item Deleted Successfully", MsgBoxStyle.OkOnly, "CMS")
            Response.Redirect("ItemCards.aspx")
        End If
    End Sub
End Class