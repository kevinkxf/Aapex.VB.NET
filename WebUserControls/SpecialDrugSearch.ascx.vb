Imports QSLib.Entities
Imports QSLib.Providers.LogProvider

Partial Class WebUserControls_SpecialDrugSearch
    Inherits System.Web.UI.UserControl
    'Private oDescription As Drugs.DrugDescriptionInfo
    Private oDrugs As Drugs.DrugCollection
    Private strName As String

    Public Event OnSendBulkRequestClicked(ByVal intDrugID As Integer, ByVal strEmail As String, ByVal strBody As String)
    Public Event OnAddToCartClicked(ByVal intDrugID As Integer)
    Public Event OnAddToCartWithPriceBeatClicked(ByVal intDrugID As Integer, ByVal fPriceBeat As Decimal, ByVal strUrl As String)

#Region "Properties"
    Public Property DrugsDataSource() As Drugs.DrugCollection
        Get
            Return Me.oDrugs
        End Get
        Set(ByVal value As Drugs.DrugCollection)
            Me.oDrugs = value
        End Set
    End Property

    'Public Property DescriptionDataSource() As Drugs.DrugDescriptionInfo
    '    Get
    '        Return Me.oDescription
    '    End Get
    '    Set(ByVal value As Drugs.DrugDescriptionInfo)
    '        Me.oDescription = value
    '    End Set
    'End Property

    Public Property DrugName() As String
        Get
            Return ViewState("DrugName")
        End Get
        Set(ByVal value As String)
            ViewState("DrugName") = value
        End Set
    End Property
#End Region

#Region "Event Handlers"
    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If Not Me.oDrugs Is Nothing And oDrugs.Count > 0 Then
            Dim strError As String = ViewState("ErrorMessage")
            If Not String.IsNullOrEmpty(strError) Then
                Me.trErrorMessage.Visible = True
                Me.lblErrorMessage.Text = strError
                ViewState.Remove("ErrorMessage")
            End If
            Dim oDrug As Drugs.DrugInfo = CType(Me.oDrugs(0), Drugs.DrugInfo)


            If Not Me.IsPostBack Then
                BindDrugInfo(oDrug)
                Dim sb As New Text.StringBuilder()
                For Each objDrug As Drugs.DrugInfo In oDrugs
                    sb.Append(objDrug.Name)
                    sb.Append(" ")
                    'sb.Append(objDrug.Quantity)    'remove by jerry on Jun 25th,2010
                    sb.Append(" - ")
                    sb.Append(String.Format("{0:c}", objDrug.Price))
                    Me.ddlVolume.Items.Add(New ListItem(sb.ToString(), objDrug.ID))
                    sb.Length = 0
                Next
            End If
        End If

        If Not String.IsNullOrEmpty(Me.DrugName) Then
            Dim oDes As Drugs.DrugDescriptionInfo = Drugs.DrugDescriptionController.GetDrugDescriptionByDrugname(Me.DrugName)
            If Not oDes Is Nothing Then
                Me.lblDescription.Text = oDes.Description
                Me.lblVendor.Text = oDes.Manufacturer
                Me.oGeneratedImage.Parameters(0).Value = Me.DrugName
            End If
            
        End If
    End Sub


    Protected Sub ddlVolume_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlVolume.SelectedIndexChanged
        Dim strValue As String = Me.ddlVolume.SelectedValue
        Dim intValue As Integer = 0
        If Integer.TryParse(strValue, intValue) Then
            Dim oDrug As Drugs.DrugInfo = Drugs.DrugController.GetDrugInfoByID(Common.WebSetting.Setting.AffiliateID, intValue)
            'Dim oDescription As Drugs.DrugDescriptionInfo = Drugs.DrugDescriptionController.GetDrugDescriptionBySkuID(intValue)
            BindDrugInfo(oDrug)
        End If
    End Sub

    Protected Sub btnAddtoCart_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnAddtoCart.Click
        Try
            Dim strValue As String = Me.ddlVolume.SelectedValue
            Dim intValue As Integer = 0
            If Integer.TryParse(strValue, intValue) Then
                RaiseEvent OnAddToCartClicked(intValue)
            End If
        Catch ex As Exception

        End Try
    End Sub

    'Submit Price beat
    Protected Sub btnButton_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnButton.Click
        If Me.Page.IsValid Then
            Dim strUrl As String = Me.txtUrl.Text
            Dim strPrice As String = Me.txtPriceBeat.Text
            Dim fPrice As Decimal
            Dim strValue As String = Me.ddlVolume.SelectedValue
            Dim intValue As Integer = 0
            If Decimal.TryParse(strPrice, fPrice) AndAlso Integer.TryParse(strValue, intValue) Then
                RaiseEvent OnAddToCartWithPriceBeatClicked(intValue, fPrice, strUrl)
            End If
        End If
    End Sub

    'Submit Bulk Request
    Protected Sub btnSubmitBR_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSubmitBR.Click
        If Me.Page.IsValid Then
            Dim strValue As String = Me.ddlVolume.SelectedValue
            Dim intValue As Integer = 0
            If Integer.TryParse(strValue, intValue) Then
                Dim oDrug As Drugs.DrugInfo = Drugs.DrugController.GetDrugInfoByID(Common.WebSetting.Setting.AffiliateID, intValue)
                If Not oDrug Is Nothing Then
                    Dim sb As New Text.StringBuilder()
                    sb.Append("<table style=""text-align:left;border:solid 1px #438ED2;width:500px"" cellspacing=""0"" cellpadding=""2""><tr><th colspan=""2"" style=""text-align:center;background-color:#438ED2;color:#ffffff;"">A Bulk Request From: ")
                    sb.Append(Me.txtFirstName.Text)
                    sb.Append(" ")
                    sb.AppendLine(Me.txtLastName.Text)
                    sb.Append("</th></tr>")
                    sb.Append("<tr><td style=""width:50%""><b>First Name:</b></td><td style=""width:50%"">")
                    sb.AppendLine(Me.txtFirstName.Text)
                    sb.Append("</td></tr>")
                    sb.Append("<tr><td style=""width:50%""><b>Last Name:</b></td><td style=""width:50%"">")
                    sb.AppendLine(Me.txtLastName.Text)
                    sb.Append("</td></tr>")
                    sb.Append("<tr><td style=""width:50%""><b>Drug ID:</b></td><td style=""width:50%"">")
                    sb.AppendLine(intValue)
                    sb.Append("</td></tr>")
                    sb.Append("<tr><td style=""width:50%""><b>Drug Name:</b></td><td style=""width:50%"">")
                    sb.AppendLine(oDrug.Name)
                    sb.Append("</td></tr>")
                    sb.Append("<tr><td><b>Company Name:</b></td><td>")
                    sb.AppendLine(Me.txtCompanyName.Text)
                    sb.Append("</td></tr>")
                    sb.Append("<tr><td><b>Quantity Request: </b></td><td>")
                    sb.AppendLine(Me.txtQuantityBR.Text)
                    sb.Append("</td></tr>")
                    sb.Append("<tr><td><b>Contact Phone: </b></td><td>")
                    sb.AppendLine(Me.txtTelephone.Text)
                    sb.Append("</td></tr>")
                    sb.Append("<tr><td><b>Comments: </b></td><td>")
                    sb.AppendLine(Me.txtComments.Text)
                    sb.Append("</td></tr></table>")
                    Dim strEmail As String = Me.txtEmail.Text
                    RaiseEvent OnSendBulkRequestClicked(intValue, strEmail, sb.ToString())
                End If
            End If

        End If
    End Sub

    Protected Sub validatorCaptcha_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs)
        Try
            Dim oCaptcha As MSCaptcha.CaptchaControl = Me.ccJoin
            oCaptcha.ValidateCaptcha(args.Value)
            If oCaptcha.UserValidated Then
                args.IsValid = True
            Else
                args.IsValid = False
                ViewState.Add("ErrorMessage", "Incorrect Verification Code. Please Try Again.")
            End If
        Catch ex As Exception

        End Try
    End Sub
#End Region

#Region "Private Functions"
    Private Sub BindDrugInfo(ByVal oDrug As Drugs.DrugInfo)
        Try
            'If String.IsNullOrEmpty(Me.strName) Then
            '    Me.lblName.Text = oDrug.Name & " - Product Details"
            'Else
            '    Me.lblName.Text = Me.strName
            'End If
            'Me.lblName.Text = oDrug.Name & " - Product Details"
            Me.lblNameBR.Text = oDrug.Name
            Me.lblNamePB.Text = oDrug.Name
            Me.lblQuantityBR.Text = oDrug.Quantity
            Me.lblQuantityPB.Text = oDrug.Quantity
            Me.lblStrengthBR.Text = oDrug.Strength
            Me.lblStrengthPB.Text = oDrug.Strength
            Me.lblTypeBR.Text = oDrug.Type
            Me.lblTypePB.Text = oDrug.Type
            Me.lblPriceBR.Text = String.Format("{0:c}", oDrug.Price)
            Me.lblPricePB.Text = String.Format("{0:c}", oDrug.Price)
            Me.hfPricePB.Value = oDrug.Price
            If oDrug.Price > 0.01 Then
                Me.rangPriceMatch.MaximumValue = oDrug.Price
            End If
        Catch ex As Exception
            LoggerManager.LogError("SpecialDrugSearch.ascx||" & ex.Message)
        End Try
    End Sub
#End Region



End Class
