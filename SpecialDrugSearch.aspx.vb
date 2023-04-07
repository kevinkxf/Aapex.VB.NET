Imports QSLib.Entities
Partial Class SpecialDrugSearch
    Inherits System.Web.UI.Page

#Region "Event Handlers"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim strName As String = Me.Request("drugname")
        If Not String.IsNullOrEmpty(strName) Then
            Dim sb As New Text.StringBuilder(strName)
            'Dim sb As New Text.StringBuilder(strName.Substring(0, 1).ToUpper())
            'sb.Append(strName.ToLower().Substring(1, strName.Length - 1))
            'sb.Append(" - Product Detail")
            Page.Title = sb.ToString()
            Me.lblName.Text = Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(strName)
            Dim oDrugs As Drugs.DrugCollection = Drugs.DrugController.GetDrugInfoByName(Common.WebSetting.Setting.AffiliateID, "%" & strName.ToLower(), False)
            Me.oSpecialDrugSearch.DrugsDataSource = oDrugs
            Me.oSpecialDrugSearch.DrugName = sb.ToString()
            If oDrugs.Count > 0 Then
                'Me.oSpecialDrugSearch.DescriptionDataSource = Drugs.DrugDescriptionController.GetDrugDescriptionBySkuID(CType(oDrugs(0), Drugs.DrugInfo).ProductID)
            End If
            If strName.ToLower = "botox" OrElse strName.ToLower = "juvederm" Then
                Me.oDrugMessage.ChangeMessage(1)
            ElseIf strName.ToLower = "dysport" OrElse strName.ToLower = "reloxin" Then
                Me.oDrugMessage.ChangeMessage(2)
            ElseIf strName.ToLower = "restylane" OrElse strName.ToLower = "perlane" Then
                oDisclaimer.ActiveViewIndex = 1
                Me.oDrugMessage.ChangeMessage(3)
            Else
                Me.oDrugMessage.ChangeMessage(0)
            End If
        Else
            Response.Redirect("~/SearchDrug.html")
        End If
        If Me.IsPostBack Then

        End If
    End Sub

    'Add to cart without price beat
    Protected Sub oSpecialDrugSearch_OnAddToCartClicked(ByVal intDrugID As Integer) Handles oSpecialDrugSearch.OnAddToCartClicked
        Try
            Dim oItem As New Orders.ShoppingCartItemInfo()
            Dim oDrug As Drugs.DrugInfo = Drugs.DrugController.GetDrugInfoByID(Common.WebSetting.Setting.AffiliateID, intDrugID)
            If Not oDrug Is Nothing Then
                oItem.PatientID = GetShoppingCartID()
                oItem.AffiliateID = Common.WebSetting.Setting.AffiliateID
                oItem.DrugID = oDrug.ID
                oItem.IPAddress = Request.UserHostAddress
                oItem.PriceBeat = 0
                If oDrug.MinimumQuantity < 1 Then
                    oItem.QTYOrdered = 1
                Else
                    oItem.QTYOrdered = oDrug.MinimumQuantity
                End If
                oItem.URL = ""
                If Orders.ShoppingCartItemController.AddDrugToShoppingCart(oItem) Then
                    Response.Redirect("~/ShoppingCart.html")
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub

    'Add to cart
    Protected Sub oSpecialDrugSearch_OnAddToCartWithPriceBeatClicked(ByVal intDrugID As Integer, ByVal fPriceBeat As Decimal, ByVal strUrl As String) Handles oSpecialDrugSearch.OnAddToCartWithPriceBeatClicked
        Dim oItem As New Orders.ShoppingCartItemInfo()
        oItem.PatientID = GetShoppingCartID()
        oItem.AffiliateID = Common.WebSetting.Setting.AffiliateID
        oItem.DrugID = intDrugID
        oItem.IPAddress = Request.UserHostAddress
        oItem.PriceBeat = fPriceBeat
        oItem.QTYOrdered = 1
        oItem.URL = strUrl
        If Orders.ShoppingCartItemController.AddDrugToShoppingCart(oItem) Then
            Response.Redirect("~/ShoppingCart.html")
        End If
    End Sub

    Protected Sub oSpecialDrugSearch_OnSendBulkRequestClicked(ByVal intDrugID As Integer, ByVal strEmail As String, ByVal strBody As String) Handles oSpecialDrugSearch.OnSendBulkRequestClicked
        Try
            Dim sb As New Text.StringBuilder("Bulk Request From ")
            sb.Append(Common.WebSetting.Setting.CompanyName)
            If Common.EmailClient.GetInstance().SendEmail(strEmail, Common.WebSetting.Setting.VolumeDiscountEmail, sb.ToString(), strBody, True) Then
                Me.mvSpecialSearch.ActiveViewIndex = 1
            End If
        Catch ex As Exception

        End Try
    End Sub
#End Region

#Region "Private Functions"
    Private Function GetShoppingCartID() As Integer

        If My.User.IsAuthenticated Then
            Return Session("PatientID")
        Else
            Dim intID As Integer = 0
            If Not Request.Cookies("ShoppingCartID") Is Nothing AndAlso Integer.TryParse(Request.Cookies("ShoppingCartID").Value, intID) Then
            Else
                intID = New Random().Next(100000000, Integer.MaxValue)
            End If
            Response.Cookies.Remove("ShoppingCartID")
            Dim oCookie As New Web.HttpCookie("ShoppingCartID", intID)
            oCookie.Expires = DateTime.Now.AddMonths(1)
            Response.Cookies.Add(oCookie)
            Return intID
        End If

    End Function
#End Region

    
   
End Class
