Imports System.Data.SqlClient
Public Class DocumentCard
    Inherits System.Web.UI.UserControl
    Dim crypt As New Cryptos
    ReadOnly con As New SqlConnection(crypt.connect_str)
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim str As String
    Dim Doc_Load_Id As String = ""
    Property Load_Id() As String
        Get
            Return Doc_Load_Id
        End Get
        Set(ByVal value As String)
            Doc_Load_Id = value
        End Set
    End Property
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("Doc_Load_ID") = Nothing
        If Not Load_Id = "" Then
            If con.State = Data.ConnectionState.Closed Then
                con.Open()
            End If
            str = "select D_Type,D_Name,D_Number from CMS_Documents where DID=@DID;"
            cmd = New SqlCommand(str, con)
            cmd.Parameters.AddWithValue("@DID", Load_Id)
            dr = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()
                lblTopRight.Text = dr(0)
                lblCenter.Text = crypt.DecryptData(dr(2))
                lblBottomLeft.Text = crypt.DecryptData(dr(1))
            End If
            dr.Close()
            con.Close()
        End If
    End Sub
    Protected Sub btView_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btView.Click
        Session("Doc_Load_ID") = Load_Id
        Response.Redirect("EditDocument.aspx")
    End Sub
End Class