Imports System.Data.SqlClient
Public Class PasswordRecovery
    Inherits System.Web.UI.Page
    Dim crypt As New Cryptos
    ReadOnly con As New SqlConnection(crypt.connect_str)
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim str As String
    Private Sub EnablePanel(ByVal sender As Object)
        sender.Enabled = True
        sender.CssClass = "showPanel"
    End Sub
    Private Sub DisablePanel(ByVal sender As Object)
        sender.Enabled = False
        sender.CssClass = "hidePanel"
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            EnablePanel(PanelStep1)
            DisablePanel(PanelStep2)
            DisablePanel(PanelStep3)
        End If
    End Sub
    Protected Sub btNext1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btNext1.Click
        If RFEmail.IsValid Then
            If con.State = Data.ConnectionState.Closed Then
                con.Open()
            End If
            str = "select SecurityQue from CMS_Users where Email=@email;"
            cmd = New SqlCommand(str, con)
            cmd.Parameters.AddWithValue("@Email", crypt.EncryptData(LCase(txtEmail.Text)))
            dr = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()
                lblSQAns.Text = dr(0)
                EnablePanel(PanelStep2)
                DisablePanel(PanelStep1)
                DisablePanel(PanelStep3)
                ViewState("email") = crypt.EncryptData(LCase(txtEmail.Text))
                txtEmail.Text = "Example@Mail.com"
            Else
                lblErrorMsg1.Text = "Email id not found !!"
            End If
            dr.Close()
            con.Close()
        End If
    End Sub
    Protected Sub btNext2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btNext2.Click
        If RFSAns.IsValid Then
            If con.State = Data.ConnectionState.Closed Then
                con.Open()
            End If
            str = "select LastName from CMS_Users where Email=@email and SecurityAns = @SecurityAns;"
            cmd = New SqlCommand(str, con)
            cmd.Parameters.AddWithValue("@Email", ViewState("email"))
            cmd.Parameters.AddWithValue("@SecurityAns", crypt.EncryptData(txtAns.Text))
            dr = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()
                EnablePanel(PanelStep3)
                DisablePanel(PanelStep1)
                DisablePanel(PanelStep2)
                ViewState("SAns") = crypt.EncryptData(txtAns.Text)
                lblSQAns.Text = "Question will appear here"
                txtAns.Text = "Answer is correct"
            Else
                lblErrorMsg2.Text = "Security Answer incorrect !!"
            End If
            dr.Close()
            con.Close()
        End If
    End Sub
    Protected Sub BtChange_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BtChange.Click
        If Page.IsValid And crypt.CMS_Valid(txtPass.Text) Then
            If con.State = Data.ConnectionState.Closed Then
                con.Open()
            End If
            str = "update CMS_Users set Password1 = @Password where Email=@email and SecurityAns = @SecurityAns;"
            cmd = New SqlCommand(str, con)
            cmd.Parameters.AddWithValue("@Email", ViewState("email"))
            cmd.Parameters.AddWithValue("@SecurityAns", ViewState("SAns"))
            cmd.Parameters.AddWithValue("@Password", crypt.EncryptData(txtPass.Text))
            cmd.ExecuteNonQuery()
            con.Close()
            Response.Redirect("AccountSuccess.htm")
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