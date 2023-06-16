Imports System.Data.SqlClient
Public Class PaymentCard
    Inherits System.Web.UI.UserControl

    Dim crypt As New Cryptos
    ReadOnly con As New SqlConnection(crypt.connect_str)
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim str As String
    Dim Card_no As String
    Dim count As Integer
    Dim Pay_Load_Id As String = ""
    Property Load_Id() As String
        Get
            Return Pay_Load_Id
        End Get
        Set(ByVal value As String)
            Pay_Load_Id = value
        End Set
    End Property
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("Pay_Load_ID") = Nothing
        If Not Load_Id = "" Then
            If con.State = Data.ConnectionState.Closed Then
                con.Open()
            End If
            str = "select C_Name,C_Number,C_Type from CMS_Cards where CID = @CID;"
            cmd = New SqlCommand(str, con)
            cmd.Parameters.AddWithValue("@CID", Load_Id)
            dr = cmd.ExecuteReader

            If dr.HasRows Then
                dr.Read()
                lblTopRight.Text = dr(2)
                lblBottomLeft.Text = dr(0)
                Card_no = crypt.DecryptData(dr(1))
                lblCenter.Text = ""
                count = 0
                For i = 0 To 15
                    If i > 3 And i < 12 Then
                        lblCenter.Text += "*"
                    Else
                        lblCenter.Text += Card_no(i)
                    End If
                    count += 1
                    If count = 4 And i <> 15 Then
                        lblCenter.Text += " "
                        count = 0
                    End If
                Next
            End If
            If lblTopRight.Text = "Credit Card" Then
                body.Style.Add("background", "url(../Images/CreditCardBG.png)")
            Else
                body.Style.Add("background", "url(../Images/DebitCardBG.png)")
            End If
            body.Style.Add("background-size", "cover")
            dr.Close()
            con.Close()
        End If
    End Sub
    Protected Sub btView_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btView.Click
        Session("Pay_Load_ID") = Load_Id
        Response.Redirect("EditCard.aspx")
    End Sub
End Class