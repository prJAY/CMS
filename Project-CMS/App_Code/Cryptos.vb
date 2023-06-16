Imports Microsoft.VisualBasic
Imports System.Configuration
Imports System.Security.Cryptography
Imports System.Text.RegularExpressions
Public Class Cryptos
    Dim eStr, dStr As String
    ReadOnly hash As String = "h@Sh2Crypt"
    ReadOnly md5 As New MD5CryptoServiceProvider()
    ReadOnly keys() As Byte = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(hash))
    ReadOnly tripdes As New TripleDESCryptoServiceProvider

    Function EncryptData(ByVal str As String) As String
        Dim data() As Byte = UTF8Encoding.UTF8.GetBytes(str)
        With tripdes
            .Key = keys
            .Mode = CipherMode.ECB
            .Padding = PaddingMode.PKCS7
        End With
        Dim transform As ICryptoTransform = tripdes.CreateEncryptor
        Dim result() As Byte = transform.TransformFinalBlock(data, 0, data.Length)
        eStr = Convert.ToBase64String(result, 0, result.Length)
        Return eStr
    End Function

    Function DecryptData(ByVal str As String) As String
        Dim data() As Byte = Convert.FromBase64String(str)
        With tripdes
            .Key = keys
            .Mode = CipherMode.ECB
            .Padding = PaddingMode.PKCS7
        End With
        Dim transform As ICryptoTransform = tripdes.CreateDecryptor
        Dim result() As Byte = transform.TransformFinalBlock(data, 0, data.Length)
        dStr = UTF8Encoding.UTF8.GetString(result, 0, result.Length)
        Return dStr
    End Function

    Function connect_str() As String
        Dim str As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        Return str
    End Function

    Function CMS_Valid(ByVal pwd As String) As Boolean

        Dim upper As New System.Text.RegularExpressions.Regex("[A-Z]")
        Dim lower As New System.Text.RegularExpressions.Regex("[a-z]")
        Dim number As New System.Text.RegularExpressions.Regex("[0-9]")
        Dim special As New System.Text.RegularExpressions.Regex("[^a-zA-Z0-9]")

        If Len(pwd) < 8 Then Return False
        If upper.Matches(pwd).Count < 0 Then Return False
        If lower.Matches(pwd).Count < 0 Then Return False
        If number.Matches(pwd).Count < 0 Then Return False
        If special.Matches(pwd).Count < 0 Then Return False

        Return True
    End Function
End Class
