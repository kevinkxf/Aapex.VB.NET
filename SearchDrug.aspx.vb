Imports QSLib.Entities

Partial Class SearchDrug
    Inherits System.Web.UI.Page

    Private Shared Products As String() = {"Anthelios", "Botox", "Durolane", "Dysport", "Emla", "Euflexxa", "Hyalgan", "Hylexin", "Implanon", "Juvederm", "Kinerase", "Lustra", "Mirena", "Neovisc", "Ombrelle", "Orthovisc", "Ostenil", "Paragard", "Perlane", "Radiesse", "Reloxin", "Restylane", "Sculptra", "Strivectin", "Supartz", "Suplasyn", "Surgiderm", "Synvisc"}
#Region "Event Handlers"

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim strName As String = Me.Request("drugname")
        If Not String.IsNullOrEmpty(strName) Then
            Dim r As String() = Me.GetProduct(strName)
            If Not r Is Nothing And r.Length > 0 Then
                Me.oDrugs.Drugs = r
                Me.mvSearchDrug.ActiveViewIndex = 0
            End If
        End If
    End Sub

    Protected Sub oSearchDrug_OnAddToCartClicked(ByVal intDrugID As Integer) Handles oSearchDrug.OnAddToCartClicked
        Dim oItem As New Orders.ShoppingCartItemInfo()
        oItem.PatientID = GetShoppingCartID()
        oItem.AffiliateID = Common.WebSetting.Setting.AffiliateID
        oItem.DrugID = intDrugID
        oItem.IPAddress = Request.UserHostAddress
        oItem.PriceBeat = 0
        oItem.QTYOrdered = 1
        oItem.URL = ""
        If Orders.ShoppingCartItemController.AddDrugToShoppingCart(oItem) Then
            Response.Redirect("~/ShoppingCart.html")
        End If
    End Sub

    Protected Sub oSearchDrug_OnPriceBeatClicked(ByVal intDrugID As Integer, ByVal fPriceBeat As Decimal, ByVal strUrl As String) Handles oSearchDrug.OnPriceBeatClicked
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

    Protected Sub oSearchDrug_OnSendBulkRequestClick(ByVal intDrugID As Integer, ByVal strEmail As String, ByVal strBody As String) Handles oSearchDrug.OnSendBulkRequestClicked
        Try
            Dim oDrug As Drugs.DrugInfo = Drugs.DrugController.GetDrugInfoByID(Common.WebSetting.Setting.AffiliateID, intDrugID)
            If Not oDrug Is Nothing Then
                Dim sb As New Text.StringBuilder("Bulk Request From ")
                sb.Append(Common.WebSetting.Setting.CompanyName)
                If Common.EmailClient.GetInstance().SendEmail(strEmail, Common.WebSetting.Setting.VolumeDiscountEmail, sb.ToString(), strBody, True) Then
                    Me.mvSearchDrug.ActiveViewIndex = 1
                End If
            End If
            Me.mvSearchDrug.ActiveViewIndex = 1
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

    Private Function GetProduct(ByVal strDrugname As String) As String()
        Dim strResult As New ArrayList()

        For Each p As String In Products
            If Regex.IsMatch(p, strDrugname, RegexOptions.IgnoreCase) Then
                strResult.Add(p)
            End If
        Next
        Return strResult.ToArray(GetType(String))
    End Function

#End Region
End Class
