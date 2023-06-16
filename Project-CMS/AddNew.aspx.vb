Imports System.Data.SqlClient
Public Class AddNew
    Inherits System.Web.UI.Page
    Dim crypt As New Cryptos
    ReadOnly con As New SqlConnection(crypt.connect_str)
    Dim cmd As SqlCommand
    Dim str As String
    Public Sub CheckSelection()
        If ddCatagory.SelectedIndex = "0" Then
            panelPass.Visible = True
            panelCard.Visible = False
            panelDoc.Visible = False
        ElseIf ddCatagory.SelectedIndex = "1" Then
            panelPass.Visible = False
            panelCard.Visible = True
            panelDoc.Visible = False
        ElseIf ddCatagory.SelectedIndex = "2" Then
            panelPass.Visible = False
            panelCard.Visible = False
            panelDoc.Visible = True
        End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CheckSelection()
        End If
        If Session("UID") = Nothing Then
            Response.Redirect("Login.aspx")
        End If
    End Sub
    Protected Sub ddCatagory_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles ddCatagory.SelectedIndexChanged
        CheckSelection()
    End Sub

    Protected Sub btSave_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btSave.Click
        If Page.IsValid Then
            If con.State = Data.ConnectionState.Closed Then
                con.Open()
            End If
            If txtNotes.Text = "" Then
                txtNotes.Text = " "
            End If
            If txtDocNotes.Text = "" Then
                txtDocNotes.Text = " "
            End If
            If ddCatagory.SelectedIndex = "0" Then
                str = "insert into CMS_Passwords (UserId,P_Name,P_URL,P_User,P_Pass,P_Notes) Values(@UID , @P_NAME , @P_URL , @P_USER , @P_PASS , @P_NOTES);"

                cmd = New SqlCommand(str, con)
                With cmd.Parameters
                    .AddWithValue("@UID", Session("UID"))
                    .AddWithValue("@P_NAME", txtName.Text)
                    .AddWithValue("@P_URL", txtURL.Text)
                    .AddWithValue("@P_USER", crypt.EncryptData(txtUser.Text)) 'ENC
                    .AddWithValue("@P_PASS", crypt.EncryptData(txtPass.Text)) 'ENC
                    .AddWithValue("@P_NOTES", txtNotes.Text)
                End With
                cmd.ExecuteNonQuery()
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('Details Saved Successfully')", True)

            ElseIf ddCatagory.SelectedIndex = "1" Then
                str = "insert into CMS_Cards (UserId,C_Name,C_Type,C_Number,C_Date) Values(@UID , @C_Name , @C_Type , @C_Number , @C_Date);"

                cmd = New SqlCommand(str, con)
                With cmd.Parameters
                    .AddWithValue("@UID", Session("UID"))
                    .AddWithValue("@C_Name", txtCardName.Text)
                    .AddWithValue("@C_Type", ddCardType.SelectedValue)
                    .AddWithValue("@C_Number", crypt.EncryptData(txtCardNo.Text)) 'ENC
                    .AddWithValue("@C_Date", crypt.EncryptData(ddEndDate.SelectedValue & "/" & txtEndYear.Text)) 'ENC
                End With
                cmd.ExecuteNonQuery()
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('Details Saved Successfully')", True)

            ElseIf ddCatagory.SelectedIndex = "2" Then
                str = "insert into CMS_Documents (UserId,D_Type,D_Name,D_Number,D_Notes) Values(@UID,@D_Type,@D_Name,@D_Number,@D_Notes);"

                cmd = New SqlCommand(str, con)
                With cmd.Parameters
                    .AddWithValue("@UID", Session("UID"))
                    .AddWithValue("@D_Type", txtDocType.Text)
                    .AddWithValue("@D_Name", crypt.EncryptData(txtDocName.Text)) 'ENC
                    .AddWithValue("@D_Number", crypt.EncryptData(txtDocNo.Text)) 'ENC
                    .AddWithValue("@D_NOTES", txtDocNotes.Text)
                End With
                cmd.ExecuteNonQuery()
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('Details Saved Successfully')", True)
            End If
            con.Close()
            cleartext()
        End If
    End Sub

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btClear.Click
        cleartext()
    End Sub

    Public Sub cleartext()
        txtCardName.Text = ""
        txtCardNo.Text = ""
        txtDocName.Text = ""
        txtDocNo.Text = ""
        txtDocNotes.Text = ""
        txtDocType.Text = ""
        txtEndYear.Text = ""
        txtName.Text = ""
        txtNotes.Text = ""
        txtPass.Text = ""
        txtURL.Text = ""
        txtUser.Text = ""
    End Sub
End Class