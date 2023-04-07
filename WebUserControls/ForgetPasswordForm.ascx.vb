
Partial Class WebUserControls_ForgetPasswordForm
    Inherits System.Web.UI.UserControl

    Public Event OnGetPasswordByEmailClicked(ByVal strEmail As String, ByVal dateDoB As DateTime)
    Public Event OnGetPasswordByUsernameClicked(ByVal strUsername As String)

    Protected Sub _validatorOption1_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles _validatorOption1.ServerValidate
        Dim u As String = Me.tbxUsername.Text
        Dim e As String = Me.tbxEmail.Text
        Dim d As String = Me.tbxDOB.Text
        If u = "" AndAlso e = "" AndAlso d = "" Then
            args.IsValid = False
            CType(source, CustomValidator).ErrorMessage = "Please enter your username or your email and birth date."
        Else
            args.IsValid = True
        End If
    End Sub

    Protected Sub _validatorOption2_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles _validatorOption2.ServerValidate
        Dim u As String = Me.tbxUsername.Text
        Dim e As String = Me.tbxEmail.Text
        Dim d As String = Me.tbxDOB.Text
        Dim c As CustomValidator = CType(source, CustomValidator)
        If String.IsNullOrEmpty(u) AndAlso (Not String.IsNullOrEmpty(e) OrElse Not String.IsNullOrEmpty(d)) Then
            If Not String.IsNullOrEmpty(e) AndAlso String.IsNullOrEmpty(d) Then
                c.ErrorMessage = "Please enter your birth date."
                args.IsValid = False
            ElseIf String.IsNullOrEmpty(e) AndAlso Not String.IsNullOrEmpty(d) Then
                args.IsValid = False
                c.ErrorMessage = "Please enter your email."
            Else
                Dim be As Boolean = Regex.IsMatch(e, "([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$")
                Dim bd As Boolean = Regex.IsMatch(d, "(0?[1-9]|[12][0-9]|3[01])[- /.](0?[1-9]|1[012])[- /.](19|20)?[0-9]{2}$")
                If Not be AndAlso bd Then
                    args.IsValid = False
                    c.ErrorMessage = "Invalid email."
                ElseIf be AndAlso Not bd Then
                    args.IsValid = False
                    c.ErrorMessage = "Invalid birth date."
                Else
                    args.IsValid = True
                End If
            End If
        Else
            args.IsValid = True
        End If
    End Sub


    Protected Sub btnRetrievePassword_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnRetrievePassword.Click
        If Page.IsValid Then
            Dim strEmail As String = Me.tbxEmail.Text
            Dim strDoB As String = Me.tbxDOB.Text
            Dim strUsername As String = Me.tbxUsername.Text
            Dim dateDob As DateTime
            If Not String.IsNullOrEmpty(strUsername) Then
                RaiseEvent OnGetPasswordByUsernameClicked(strUsername)
            ElseIf Not String.IsNullOrEmpty(strEmail) AndAlso Not String.IsNullOrEmpty(strDoB) AndAlso DateTime.TryParse(strDoB, dateDob) Then

                RaiseEvent OnGetPasswordByEmailClicked(strEmail, dateDob)
            End If
        End If
    End Sub

    Protected Sub validationCode_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles validationCode.ServerValidate
        If String.IsNullOrEmpty(args.Value) Then
            args.IsValid = False
            CType(source, CustomValidator).ErrorMessage = "Please input the verification code."
        Else
            Me.ccCode.ValidateCaptcha(args.Value)
            args.IsValid = Me.ccCode.UserValidated
        End If
    End Sub
End Class
