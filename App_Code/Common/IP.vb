Imports Microsoft.VisualBasic
Imports QSLib.Entities

Public Class ClsIP
    Public Shared Function GetClientIP() As String
        Dim result As String = HttpContext.Current.Request.ServerVariables("HTTP_X_FORWARDED_FOR ")
        If String.IsNullOrEmpty(result) Then
            result = HttpContext.Current.Request.ServerVariables("REMOTE_ADDR ")
            If String.IsNullOrEmpty(result) Then
                result = HttpContext.Current.Request.UserHostAddress
            End If
        End If
        GetClientIP = result '"207.6.220.206 " 'result
    End Function

    Public Shared Function GetCountryCodeFromIP(ByVal strIP As String) As String
        GetCountryCodeFromIP = ""
        Dim oIPs As Users.IPAddressCollection = Users.IPAddressController.GetIPAddressCountryInfoByIP(strIP)
        If oIPs.Count > 0 Then
            GetCountryCodeFromIP = CType(oIPs(0), Users.IPAddressInfo).Country
        End If
    End Function

End Class
