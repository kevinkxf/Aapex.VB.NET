
Partial Class WebUserControls_PartnershipForm
    Inherits System.Web.UI.UserControl

    Public Event OnSubmitClicked(ByVal strTo As String, ByVal strEmailBody As String)

    Protected Sub validatorEmail_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorEmail.ServerValidate
        If String.IsNullOrEmpty(args.Value) Then
            args.IsValid = False
        Else
            args.IsValid = Regex.IsMatch(args.Value, "^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$")
        End If
    End Sub

    Protected Sub validatorTelephone_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorTelephone.ServerValidate
        args.IsValid = HasNDigits(Me.txtHomePhone1.Text, 3) And HasNDigits(Me.txtHomePhone2.Text, 3) And HasNDigits(Me.txtHomePhone3.Text, 4)
    End Sub

    Protected Sub validatorAltPhone_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validatorAltPhone.ServerValidate
        If String.IsNullOrEmpty(Me.txtAltPhone1.Text) AndAlso String.IsNullOrEmpty(Me.txtAltPhone2.Text) AndAlso String.IsNullOrEmpty(Me.txtAltPhone3.Text) Then
            args.IsValid = True
        Else
            args.IsValid = HasNDigits(Me.txtAltPhone1.Text, 3) And HasNDigits(Me.txtAltPhone2.Text, 3) And HasNDigits(Me.txtAltPhone3.Text, 4)
        End If
    End Sub

#Region "Private Functions"
    Private Function HasNDigits(ByVal strInput As String, ByVal intCount As Integer) As Boolean
        Return Regex.IsMatch(strInput, "^[0-9]{" & intCount & "}")
    End Function

    Private Function GetPhone(ByVal strP1 As String, ByVal strP2 As String, ByVal strP3 As String) As String
        GetPhone = Nothing
        If Not String.IsNullOrEmpty(strP1) AndAlso Not String.IsNullOrEmpty(strP2) AndAlso Not String.IsNullOrEmpty(strP3) Then
            Dim sb As New Text.StringBuilder(strP1)
            sb.Append("-")
            sb.Append(strP2)
            sb.Append("-")
            sb.Append(strP3)
            GetPhone = sb.ToString()
            sb.Length = 0
        End If
    End Function
#End Region

    
    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnSubmit.Click
        If Page.IsValid Then
            Dim sb As New Text.StringBuilder()
            sb.Append("<table style=""text-align:left;border:solid 1px #438ED2;width:500px"" cellspacing=""0"" cellpadding=""2""><tr><th colspan=""2"" style=""text-align:center;background-color:#438ED2;color:#ffffff;"">A Partnership Request From: ")
            sb.Append(Me.ddlTitle.SelectedValue)
            sb.Append(" ")
            sb.Append(Me.txtFirstname.Text)
            sb.Append(" ")
            sb.AppendLine(Me.txtlastname.Text)
            sb.Append("</th></tr>")
            sb.Append("<tr><td style=""width:50%""><b>First Name:</b></td><td style=""width:50%"">")
            sb.AppendLine(Me.txtFirstname.Text)
            sb.Append("</td></tr>")
            sb.Append("<tr><td style=""width:50%""><b>Last Name:</b></td><td style=""width:50%"">")
            sb.AppendLine(Me.txtlastname.Text)
            sb.Append("</td></tr>")
            sb.Append("<tr><td style=""width:50%""><b>Company Name:</b></td><td style=""width:50%"">")
            sb.AppendLine(Me.txtCompanyName.Text)
            sb.Append("</td></tr>")
            sb.Append("<tr><td style=""width:50%""><b>Company Website:</b></td><td style=""width:50%"">")
            sb.AppendLine(Me.txtCompanyWebsite.Text)
            sb.Append("</td></tr>")
            sb.Append("<tr><td><b>Primary Telephone:</b></td><td>")
            sb.AppendLine(GetPhone(Me.txtHomePhone1.Text, Me.txtHomePhone2.Text, Me.txtHomePhone3.Text))
            sb.Append("</td></tr>")
            sb.Append("<tr><td><b>Secondary Telephone: </b></td><td>")
            sb.AppendLine(GetPhone(Me.txtAltPhone1.Text, Me.txtAltPhone2.Text, Me.txtAltPhone3.Text))
            sb.Append("</td></tr>")
            sb.Append("<tr><td><b>Product Description: </b></td><td>")
            sb.AppendLine(Me.txtDescription.Text)
            sb.Append("</td></tr>")
            sb.Append("<tr><td><b>Comments: </b></td><td>")
            sb.AppendLine(Me.txtComment.Text)
            sb.Append("</td></tr></table>")
            RaiseEvent OnSubmitClicked(Me.txtEmail.Text, sb.ToString())
            sb.Length = 0
        End If
    End Sub
End Class
