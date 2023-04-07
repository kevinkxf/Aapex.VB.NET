Imports System.Web.Security
Imports QSLib.Entities
Partial Class SignIn
    Inherits System.Web.UI.Page
#Region "Event Handlers"
    Protected Sub oSignin_OnLoginClicked(ByVal strUsername As String) Handles oSignin.OnLoginClicked
        Dim oAcc As QSLib.Entities.Patients.PatientAccountInfo = QSLib.Entities.Patients.PatientAccountController.GetPatientAccountInfoByName(strUsername, Common.WebSetting.Setting.AffiliateID)
        If Not oAcc Is Nothing Then
            Session("PatientID") = oAcc.PatientID
            Me.MergeShoppingCart(oAcc.PatientID)

            Dim strReturn As String = Session("ReturnUrl")

            'For URL Rewriter. Remove thr querry string, so the rewriter won't add them twice
            'Dim strReturn As String = Request.QueryString("ReturnUrl")
            'If Not String.IsNullOrEmpty(strReturn) AndAlso strReturn.Contains(".html?") Then
            '    strReturn = Regex.Replace(strReturn, "\?.*", "")
            'End If
            'strReturn = Regex.Replace(strReturn, ".aspx", ".html")
            '=================================================================================
            FormsAuthentication.SetAuthCookie(strUsername, False)
            If String.IsNullOrEmpty(strReturn) OrElse (Not String.IsNullOrEmpty(strReturn) AndAlso Not Regex.IsMatch(strReturn, Common.WebSetting.Setting.AuthorizedPage, RegexOptions.IgnoreCase)) Then
                Response.Redirect("~/myaccount.html", True)
            Else
                Response.Redirect(strReturn, True)
            End If
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        
    End Sub

    'Protected Sub btnCreate_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCreate.Click
    '    Response.Redirect("~/Registration.html", True)
    'End Sub
#End Region
#Region "Private Functions"
    ''' <summary>
    ''' Merge Shopping Items from anonymous to patient
    ''' </summary>
    ''' <param name="intPatientID"></param>
    ''' <remarks></remarks>
    Private Sub MergeShoppingCart(ByVal intPatientID As Integer)
        Try
            Dim intID As Integer
            If Not Request.Cookies("ShoppingCartID") Is Nothing AndAlso Integer.TryParse(Request.Cookies("ShoppingCartID").Value, intID) Then
                Orders.ShoppingCartItemController.SwapShoppingCart(intID, Common.WebSetting.Setting.AffiliateID, intPatientID)
                Response.Cookies("ShoppingCartID").Expires = Date.Now.AddDays(-1)
            End If
        Catch ex As Exception

        End Try
    End Sub
#End Region

   
    
End Class
