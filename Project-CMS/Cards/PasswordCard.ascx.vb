Imports System.Data.SqlClient
Public Class PasswordCard
    Inherits System.Web.UI.UserControl
    Dim crypt As New Cryptos
    ReadOnly con As New SqlConnection(crypt.connect_str)
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim str As String
    Dim Pass_Load_Id As String = ""
    Property Load_Id() As String
        Get
            Return Pass_Load_Id
        End Get
        Set(ByVal value As String)
            Pass_Load_Id = value
        End Set
    End Property
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("Pass_Load_ID") = Nothing
        If Not Load_Id = "" Then
            If con.State = Data.ConnectionState.Closed Then
                con.Open()
            End If
            str = "select P_Name,P_User from CMS_Passwords where PID = @PID;"
            cmd = New SqlCommand(str, con)
            cmd.Parameters.AddWithValue("@PID", Load_Id)
            dr = cmd.ExecuteReader

            If dr.HasRows Then
                dr.Read()
                lblCenter.Text = crypt.DecryptData(dr(1))
                lblBottomLeft.Text = dr(0)
            End If

            dr.Close()
            con.Close()
        End If
    End Sub

    Protected Sub btView_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btView.Click
        Session("Pass_Load_ID") = Load_Id
        Response.Redirect("EditPassword.aspx")
    End Sub
End Class