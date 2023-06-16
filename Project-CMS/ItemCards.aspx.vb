Imports System.Data.SqlClient
Imports System.Data
Public Class ItemCards
    Inherits System.Web.UI.Page
    Dim crypt As New Cryptos
    ReadOnly con As New SqlConnection(crypt.connect_str)
    Dim cmd As SqlCommand
    Dim da As SqlDataAdapter
    Dim ds As DataSet
    Dim str As String
    Dim count As Integer = 0
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("UID") = Nothing Then
            Response.Redirect("Login.aspx")
        Else
            If Request.QueryString("Req") = "0" Then
                count = 2
                Load_PasswordCard()
            ElseIf Request.QueryString("Req") = "1" Then
                count = 2
                Load_PaymentCard()
            ElseIf Request.QueryString("Req") = "2" Then
                count = 2
                Load_DocumentCard()
            Else
                count = 0
                Load_PasswordCard()
                Load_PaymentCard()
                Load_DocumentCard()
            End If
            If count = 3 Then
                Panel1.Visible = True
                Panel1.Enabled = False
            Else
                Panel1.Visible = False
                Panel1.Enabled = False
            End If
        End If

    End Sub

    Public Sub Load_PasswordCard()
        Dim n As Integer
        If con.State = ConnectionState.Closed Then
            con.Open()
        End If
        str = "select PID from CMS_Passwords where UserId = @UserID;"
        cmd = New SqlCommand(str, con)
        cmd.Parameters.AddWithValue("@UserID", Session("UID"))
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        da.Fill(ds)
        n = ds.Tables(0).Rows.Count
        If n > 0 Then
            For i = 0 To n - 1
                Dim PS1 As PasswordCard = LoadControl("~\Cards\PasswordCard.ascx")
                PS1.ID = "PasswordCard" & (i + 1)
                PS1.Load_Id = ds.Tables(0).Rows(i).Item(0)
                PlaceHolder1.Controls.Add(PS1)
            Next
        Else
            count += 1
        End If
        ds.Clear()
        con.Close()
    End Sub

    Public Sub Load_PaymentCard()
        Dim n As Integer
        If con.State = ConnectionState.Closed Then
            con.Open()
        End If
        str = "select CID,C_Type from CMS_Cards where UserId = @UserID;"
        cmd = New SqlCommand(str, con)
        cmd.Parameters.AddWithValue("@UserID", Session("UID"))
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        da.Fill(ds)
        n = ds.Tables(0).Rows.Count
        If n > 0 Then
            For i = 0 To n - 1
                Dim PC1 As PaymentCard = LoadControl("~\Cards\PaymentCard.ascx")
                PC1.ID = "PaymentCard" & (i + 1)
                PC1.Load_Id = ds.Tables(0).Rows(i).Item(0)
                PlaceHolder1.Controls.Add(PC1)
            Next
        Else
            count += 1
        End If
        ds.Clear()
        con.Close()
    End Sub

    Public Sub Load_DocumentCard()
        Dim n As Integer
        If con.State = ConnectionState.Closed Then
            con.Open()
        End If
        str = "select DID from CMS_Documents where UserId = @UserID;"
        cmd = New SqlCommand(str, con)
        cmd.Parameters.AddWithValue("@UserID", Session("UID"))
        da = New SqlDataAdapter(cmd)
        ds = New DataSet
        da.Fill(ds)
        n = ds.Tables(0).Rows.Count

        If n > 0 Then
            For i = 0 To n - 1
                Dim DC1 As DocumentCard = LoadControl("~\Cards\DocumentCard.ascx")
                DC1.ID = "DocumentCard" & (i + 1)
                DC1.Load_Id = ds.Tables(0).Rows(i).Item(0)
                PlaceHolder1.Controls.Add(DC1)
            Next
        Else
            count += 1
        End If
        ds.Clear()
        con.Close()
    End Sub
End Class