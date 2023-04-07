Imports QSLib.Entities
Imports QSLib.Providers.LogProvider

Partial Class WebUserControls_SearchDrug
    Inherits System.Web.UI.UserControl

    Private oDrugs As Drugs.DrugCollection

    Public Event OnSendBulkRequestClicked(ByVal intDrugID As Integer, ByVal strEmail As String, ByVal strBody As String)
    Public Event OnAddToCartClicked(ByVal intDrugID As Integer)
    Public Event OnPriceBeatClicked(ByVal intDrugID As Integer, ByVal fPriceBeat As Decimal, ByVal strUrl As String)

    Public Property DrugDataSource() As Drugs.DrugCollection
        Get
            Return Me.oDrugs
        End Get
        Set(ByVal value As Drugs.DrugCollection)
            Me.oDrugs = value
        End Set
    End Property

#Region "Event Handlers"
    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If Not Me.oDrugs Is Nothing AndAlso Me.oDrugs.Count > 0 Then
            Me.rpSearchResult.DataSource = Me.oDrugs
            Me.rpSearchResult.DataBind()
        Else
            Me.mvSearchDrug.ActiveViewIndex = 1
        End If
    End Sub

    Protected Sub rpSearchResult_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rpSearchResult.ItemCommand
        If Me.Page.IsValid Then
            If e.CommandName = "Buy" Then
                Try
                    RaiseEvent OnAddToCartClicked(e.CommandArgument)
                Catch ex As Exception

                End Try
            ElseIf e.CommandName = "PriceBeat" Then
                Try
                    Dim fPriceBeat As Decimal = 0
                    Dim strUrl As String = CType(e.Item.FindControl("tbxUrl"), TextBox).Text
                    If Decimal.TryParse(CType(e.Item.FindControl("tbxPriceBeat"), TextBox).Text, fPriceBeat) AndAlso Not String.IsNullOrEmpty(strUrl) Then
                        RaiseEvent OnPriceBeatClicked(e.CommandArgument, fPriceBeat, strUrl)
                    End If
                Catch ex As Exception

                End Try
            ElseIf e.CommandName = "SubmitBR" Then
                'Send Bulk Request Email
                Try
                    Dim sb As New Text.StringBuilder()
                    Dim intDrugID As Integer = Integer.Parse(e.CommandArgument)
                    Dim oDrug As Drugs.DrugInfo = Drugs.DrugController.GetDrugInfoByID(Common.WebSetting.Setting.AffiliateID, intDrugID)
                    If Not oDrug Is Nothing Then
                        sb.Append("<table style=""text-align:left;border:solid 1px #438ED2;width:500px"" cellspacing=""0"" cellpadding=""2""><tr><th colspan=""2"" style=""text-align:center;background-color:#438ED2;color:#ffffff;"">A Bulk Request From: ")
                        sb.Append(CType(e.Item.FindControl("txtFirstName"), TextBox).Text)
                        sb.Append(" ")
                        sb.AppendLine(CType(e.Item.FindControl("txtLastName"), TextBox).Text)
                        sb.Append("</th></tr>")
                        sb.Append("<tr><td style=""width:50%""><b>First Name:</b></td><td style=""width:50%"">")
                        sb.Append(CType(e.Item.FindControl("txtFirstName"), TextBox).Text)
                        sb.Append("</td></tr>")
                        sb.Append("<tr><td><b>Last Name:</b></td><td>")
                        sb.Append(CType(e.Item.FindControl("txtLastName"), TextBox).Text)
                        sb.Append("</td></tr>")
                        sb.Append("<tr><td><b>Drug ID:</b></td><td>")
                        sb.Append(intDrugID)
                        sb.Append("</td></tr>")
                        sb.Append("<tr><td><b>Drug Name:</b></td><td>")
                        sb.Append(oDrug.Name)
                        sb.Append("</td></tr>")
                        sb.Append("<tr><td><b>Company Name:</b></td><td>")
                        sb.AppendLine(CType(e.Item.FindControl("txtCompanyName"), TextBox).Text)
                        sb.Append("</td></tr>")
                        sb.Append("<tr><td><b>Quantity Request: </b></td><td>")
                        sb.AppendLine(CType(e.Item.FindControl("txtQuantityBR"), TextBox).Text)
                        sb.Append("</td></tr>")
                        sb.Append("<tr><td><b>Contact Phone: </b></td><td>")
                        sb.AppendLine(CType(e.Item.FindControl("txtTelephone"), TextBox).Text)
                        sb.Append("</td></tr>")
                        sb.Append("<tr><td><b>Comments: </b></td><td>")
                        sb.AppendLine(CType(e.Item.FindControl("txtComments"), TextBox).Text)
                        sb.Append("</td></tr></table>")
                        Dim strEmail As String = CType(e.Item.FindControl("txtEmail"), TextBox).Text
                        RaiseEvent OnSendBulkRequestClicked(intDrugID, strEmail, sb.ToString())
                    End If
                Catch ex As Exception

                End Try

            End If
        End If
    End Sub

    Protected Sub rpSearchResult_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles rpSearchResult.ItemDataBound
        If e.Item.ItemType = ListItemType.Item OrElse e.Item.ItemType = ListItemType.AlternatingItem Then
            Try
                Dim oDrug As Drugs.DrugInfo = CType(e.Item.DataItem, Drugs.DrugInfo)
                CType(e.Item.FindControl("lblName"), Label).Text = oDrug.Name
                CType(e.Item.FindControl("lblStrength"), Label).Text = oDrug.Strength
                CType(e.Item.FindControl("lblQuantity"), Label).Text = oDrug.Quantity
                CType(e.Item.FindControl("lblType"), Label).Text = oDrug.Type.ToUpper()
                CType(e.Item.FindControl("lblNamePB"), Label).Text = oDrug.Name
                CType(e.Item.FindControl("lblStrengthPB"), Label).Text = oDrug.Strength
                CType(e.Item.FindControl("lblQuantityPB"), Label).Text = oDrug.Quantity
                CType(e.Item.FindControl("lblTypePB"), Label).Text = oDrug.Type.ToUpper()
                CType(e.Item.FindControl("lblPrice"), Label).Text = String.Format("{0:c}", Math.Round(oDrug.Price, 2, MidpointRounding.AwayFromZero))
                CType(e.Item.FindControl("hfPricePB"), HiddenField).Value = Math.Round(oDrug.Price, 2, MidpointRounding.AwayFromZero)
                CType(e.Item.FindControl("lblPricePB"), Label).Text = String.Format("{0:c}", Math.Round(oDrug.Price, 2, MidpointRounding.AwayFromZero))
                CType(e.Item.FindControl("lblNameBR"), Label).Text = oDrug.Name
                CType(e.Item.FindControl("lblTypeBR"), Label).Text = oDrug.Type.ToUpper()
                CType(e.Item.FindControl("lblStrengthBR"), Label).Text = oDrug.Strength
                CType(e.Item.FindControl("lblQuantityBR"), Label).Text = oDrug.Quantity
                CType(e.Item.FindControl("lblPriceBR"), Label).Text = String.Format("{0:c}", Math.Round(oDrug.Price, 2, MidpointRounding.AwayFromZero))
                Dim oButton As ImageButton = CType(e.Item.FindControl("btnAddtoCart"), ImageButton)
                oButton.CommandName = "Buy"
                oButton.CommandArgument = oDrug.ID

                oButton = CType(e.Item.FindControl("btnSubmitBR"), ImageButton)
                oButton.CommandName = "SubmitBR"
                oButton.CommandArgument = oDrug.ID

                Dim strGroup As String = "PriceBeat" & oDrug.ID
                Dim oBtn As ImageButton = CType(e.Item.FindControl("btnButton"), ImageButton)
                oBtn.CommandArgument = oDrug.ID
                oBtn.CommandName = "PriceBeat"
                oBtn.ValidationGroup = strGroup 'Validation

                CType(e.Item.FindControl("vsPriceBeat"), ValidationSummary).ValidationGroup = strGroup
                CType(e.Item.FindControl("rvPriceBeat"), RequiredFieldValidator).ValidationGroup = strGroup
                CType(e.Item.FindControl("rvUrl"), RequiredFieldValidator).ValidationGroup = strGroup
                Dim oValidator As RangeValidator = CType(e.Item.FindControl("rangePriceBeat"), RangeValidator)
                oValidator.MaximumValue = IIf(oDrug.Price > 0.01, oDrug.Price, 0.02)
                oValidator.ValidationGroup = strGroup
            Catch ex As Exception
                e.Item.Visible = False
                LoggerManager.LogError("SearchDrug.ascx||" & ex.Message)
            End Try
        ElseIf e.Item.ItemType = ListItemType.Header Then
            Try
                'If Any Error Message, show at top
                Dim strErrorMessage As String = ViewState("ErrorMessage")
                If Not String.IsNullOrEmpty(strErrorMessage) Then
                    CType(e.Item.FindControl("lblErrorMessage"), Label).Text = strErrorMessage
                    CType(e.Item.FindControl("trErrorMessage"), HtmlTableRow).Visible = True
                    ViewState.Remove("ErrorMessage")
                End If
            Catch ex As Exception

            End Try
        End If
    End Sub

    Protected Sub validatorCaptcha_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs)
        'args.IsValid = Me.txtPassword.Text = Me.txtPassword2.Text
        Try
            'Dim oValidator As CustomValidator = CType(source, CustomValidator)
            'Dim oItem As RepeaterItem = CType(CType(source, CustomValidator).NamingContainer, RepeaterItem)
            Dim oCaptcha As MSCaptcha.CaptchaControl = CType(CType(CType(source, CustomValidator).NamingContainer, RepeaterItem).FindControl("ccJoin"), MSCaptcha.CaptchaControl)
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
End Class
