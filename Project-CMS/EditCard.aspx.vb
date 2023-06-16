Imports System.Data.SqlClient
Public Class EditCard
    Inherits System.Web.UI.Page
    Dim crypt As New Cryptos
    ReadOnly con As New SqlConnection(crypt.connect_str)
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim str As String
    Dim dd(1) As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Pay_Load_ID") = Nothing Then
            Response.Redirect("ItemCards.aspx")
        ElseIf Not IsPostBack Then
            If con.State = Data.ConnectionState.Closed Then
                con.Open()
            End If
            str = "select * from CMS_Cards where CID=@CID;"
            cmd = New SqlCommand(str, con)
            cmd.Parameters.AddWithValue("@CID", Session("Pay_Load_ID"))
            dr = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()
                txtCardName.Text = dr(2)
                txtCardNo.Text = crypt.DecryptData(dr(4))
                ddCardType.SelectedValue = dr(3)
                dd = Split(crypt.DecryptData(dr(5)), "/")
                ddEndDate.SelectedValue = dd(0)
                txtEndYear.Text = dd(1)
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
            str = "Update CMS_Cards set C_Name = @Name , C_Type = @Type,C_Number = @No,C_Date = @Date where CID = @CID"
            cmd = New SqlCommand(str, con)
            With cmd.Parameters
                .AddWithValue("@CID", Session("Pay_Load_ID"))
                .AddWithValue("@Name", txtCardName.Text)
                .AddWithValue("@Type", ddCardType.SelectedValue)
                .AddWithValue("@No", crypt.EncryptData(txtCardNo.Text))
                .AddWithValue("@Date", crypt.EncryptData(ddEndDate.SelectedValue & "/" & txtEndYear.Text))
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
            str = "delete from CMS_Cards where CID = @CID"
            cmd = New SqlCommand(str, con)
            cmd.Parameters.AddWithValue("@CID", Session("Pay_Load_ID"))
            cmd.ExecuteNonQuery()
            MsgBox("Item Deleted Successfully", MsgBoxStyle.OkOnly, "CMS")
            Response.Redirect("ItemCards.aspx")
        End If
    End Sub
End Class