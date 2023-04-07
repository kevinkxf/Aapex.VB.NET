Imports QSLib.Entities

Partial Class TopContainer
    Inherits System.Web.UI.MasterPage
    Public ReadOnly Property BaseUrl() As String
        Get
            Return Request.Url.GetLeftPart(UriPartial.Authority) + VirtualPathUtility.ToAbsolute("~/")
        End Get
    End Property

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        'Restrict www, not non-www
        Dim strHost As String = Request.ServerVariables("HTTP_HOST") 'PATH_INFO
        'If strHost.ToLower() = "canadadrugsunited.com" Then
        If strHost.ToLower() = "kevintest" Then
            Response.Clear()
            Response.StatusCode = 301
            Response.Status = "301 Moved Permanently"
            Dim defaultUrl As String
            If LCase(Request.ServerVariables("PATH_INFO")) = "default.aspx" Then
                defaultUrl = ""
            Else
                defaultUrl = Request.ServerVariables("PATH_INFO")
            End If
            'Response.AddHeader("Location", "http://" & Replace("www.canadadrugsunited.com/" & Request.ServerVariables("PATH_INFO"), "//", "/"))
            Response.AddHeader("Location", "http://" & Replace("loc/" & defaultUrl, "//", "/"))

            'Response.Redirect("http://" & Replace("www.canadadrugsunited.com/" & Request.ServerVariables("PATH_INFO"), "//", "/"))
        End If


        Me.Page.Title = Common.WebSetting.Setting.WebSiteName
        Dim strRawurl As String = DirectCast(Me.Page, System.Web.UI.Page).AppRelativeVirtualPath.ToLower()




        'Check HTTPS Redirection

        If Common.WebSetting.Setting.EnforceHTTPSForSecurePage AndAlso Not Request.IsSecureConnection AndAlso Regex.IsMatch(strRawurl, Common.WebSetting.Setting.SecurePage, RegexOptions.IgnoreCase) Then
            Response.Redirect(GetSecureRedirectUrl(Request.Url), True)
        ElseIf Request.IsSecureConnection AndAlso (Not Common.WebSetting.Setting.EnforceHTTPSForSecurePage OrElse (Common.WebSetting.Setting.EnforceHTTPSForSecurePage AndAlso Not Regex.IsMatch(strRawurl, Common.WebSetting.Setting.SecurePage, RegexOptions.IgnoreCase))) Then
            Response.Redirect(GetSecureRedirectUrl(Request.Url, False), True)
        End If

        If strRawurl = "~/default.aspx" Then
            'Me.spSitePath.Visible = False
        ElseIf strRawurl = "~/orthopedic.aspx" Then
            Me.oTopBanner.ChangeBanner(1)
        ElseIf strRawurl = "~/oncology.aspx" Then
            Me.oTopBanner.ChangeBanner(2)
        ElseIf strRawurl = "~/cosmetic.aspx" Then
            Me.oTopBanner.ChangeBanner(3)
        ElseIf strRawurl = "~/birthcontrol.aspx" Then
            Me.oTopBanner.ChangeBanner(4)
        End If

        'Return Url
        SetReturlURL(strRawurl)
        If My.User.IsAuthenticated Then
            SetUserInfo()
        Else
            If Not String.IsNullOrEmpty(strRawurl) AndAlso Regex.IsMatch(strRawurl, Common.WebSetting.Setting.AuthorizedPage, RegexOptions.IgnoreCase) Then
                Response.Redirect("~/Signin.html", True)
            End If
        End If
    End Sub

    Private Sub SetUserInfo()
        Dim intPatientID As Integer
        If Not Integer.TryParse(Session("PatientID"), intPatientID) Then
            Dim strUsername As String = My.User.Name
            Dim oAcc As QSLib.Entities.Patients.PatientAccountInfo = QSLib.Entities.Patients.PatientAccountController.GetPatientAccountInfoByName(strUsername, Common.WebSetting.Setting.AffiliateID)
            If Not oAcc Is Nothing Then
                Session("PatientID") = oAcc.PatientID
            End If
        End If
    End Sub

    Private Sub SetReturlURL(ByVal strRawurl As String)
        If Not String.IsNullOrEmpty(strRawurl) AndAlso Not Regex.IsMatch(strRawurl, "signin.(html|aspx)|signout.(html|aspx)|registration.(html|aspx)", RegexOptions.IgnoreCase) Then
            Session("ReturnUrl") = Request.RawUrl
        End If
    End Sub

    Private Function GetSecureRedirectUrl(ByVal fromUrl As Uri) As String
        Return (fromUrl.AbsoluteUri).Replace("http://", "https://")
    End Function

    Private Function GetSecureRedirectUrl(ByVal fromUrl As Uri, ByVal SetSecure As Boolean) As String
        If SetSecure = True Then
            Return (fromUrl.AbsoluteUri).Replace("http://", "https://")
        Else
            Return (fromUrl.AbsoluteUri).Replace("https://", "http://")
        End If
    End Function

    Private Function GetCountryCodeFromIP(ByVal strIP As String) As String
        GetCountryCodeFromIP = ""
        Dim oIPs As Users.IPAddressCollection = Users.IPAddressController.GetIPAddressCountryInfoByIP(strIP)
        If oIPs.Count > 0 Then
            GetCountryCodeFromIP = CType(oIPs(0), Users.IPAddressInfo).Country
        End If
    End Function
End Class

