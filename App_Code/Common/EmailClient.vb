Imports Microsoft.VisualBasic
Imports System.Net
Imports System.Net.Mail
Namespace Common
    Public Class EmailClient
        Private Shared oSmtp As EmailClient
        Private oEmail As SmtpClient
        Private sbBody As Text.StringBuilder
        Public Shared Function GetInstance() As EmailClient
            If oSmtp Is Nothing Then
                oSmtp = New EmailClient()
            End If
            Return oSmtp
        End Function

        Private Sub New()
            oEmail = New SmtpClient()
        End Sub

        Public Function SendEmail(ByVal strTo As String, ByVal strSubject As String, ByVal strBody As String) As Boolean
            Try
                oEmail.Send("", strTo, strSubject, strBody)
                Return True
            Catch ex As Exception
                Return False
            End Try
        End Function

        Public Function SendEmail(ByVal strTo As String, ByVal strSubject As String, ByVal strBody As String, ByVal isHtml As Boolean) As Boolean
            Try
                oEmail.Send("", strTo, strSubject, strBody)
                Return True
            Catch ex As Exception
                Return False
            End Try
        End Function

        Public Function SendEmail(ByVal strFrom As String, ByVal strTo As String, ByVal strSubject As String, ByVal strBody As String) As Boolean
            Try
                oEmail.Send(strFrom, strTo, strSubject, strBody)
                Return True
            Catch ex As Exception
                Return False
            End Try
        End Function

        Public Function SendEmail(ByVal strFrom As String, ByVal strTo As String, ByVal strSubject As String, ByVal strBody As String, ByVal isHtml As Boolean) As Boolean
            Try
                Dim oMessage As New MailMessage(strFrom, strTo, strSubject, strBody)
                oMessage.IsBodyHtml = isHtml
                Me.oEmail.Send(oMessage)
                Return True
            Catch ex As Exception
                Return False
            End Try
        End Function

        ''' <summary>
        ''' Order Confirmation Letter
        ''' </summary>
        ''' <param name="strTo">Customer's Email Address</param>
        ''' <param name="name">Customer's Name</param>
        ''' <param name="onumber">Order ID in array</param>
        ''' <returns></returns>
        ''' <remarks></remarks>
        Public Function SendOrderConfirmationEmail(ByVal strTo As String, ByVal name As String, ByVal onumber() As String) As Boolean
            Me.sbBody = New StringBuilder()
            Me.sbBody.Append("<html><body>")
            Me.sbBody.Append("<font face=""arial""> <p><B>Dear " + name + ",</B></p><BR/><BR/>")
            Me.sbBody.Append("======================================================================================<BR/>")
            Me.sbBody.Append("<a href=" + WebSetting.Setting.WebSiteName + ">www." + WebSetting.Setting.WebSiteName + "</a> - Order Confirmed<BR/>")
            Me.sbBody.Append("======================================================================================<BR><BR>")
            Me.sbBody.Append(" Thank you for submitting your online medication order with <a href=" + WebSetting.Setting.WebSiteName + ">www." + WebSetting.Setting.WebSiteName + "</a>, Canada's fastest growing and most trusted mail-order pharmacy service!</B>  This email is to confirm that we successfully received your online order and will be processing it very shortly. <B> Your order confirmation number is: <br/><ul>")
            For Each o As String In onumber
                Me.sbBody.Append("<li>AAPEX-" + o.PadLeft(6, "0") + "</li><br/>")
            Next
            Me.sbBody.Append(" </ul></B> To check on the status of your order, please click on the following link and enter the login codes you created at the time you setup your account with us.  If you have forgotten your website login codes, please contact our toll-free customer support center at <B>" + WebSetting.Setting.TollFreeTel + "</B> during the hours of <B>7am-5pm PST, Monday through Friday.</B> and one of our representatives can assist you.<BR/><BR/>  ")
            Me.sbBody.Append(" <B>Order Status Link:</B> <a href=" + WebSetting.Setting("SecureWebSiteURL") + "/CheckOrder.html>www." + WebSetting.Setting.WebSiteName + "</a><BR/><BR/> ")
            Me.sbBody.Append("<B>Please remember that if you are ordering NEW prescription medications, you will need to fax, mail, or email us copies of your prescriptions.  Remember, all NEW prescription drug orders must be accompanied by valid prescriptions.  You can fax, mail, or email your prescriptions to us using the details below.  If you are simply placing a REFILL order and therefore have already sent us your prescriptions in the past, you will NOT need to send us your prescriptions again.<BR/><BR/> ")
            Me.sbBody.Append("  24 Hour Toll-Free Fax:</B> " + WebSetting.Setting.TollFreeFax + "<BR/><BR/>  ")
            Me.sbBody.Append("  <B>Email:</B><a href='mailto:" + WebSetting.Setting.ContactEmail + "'>" + WebSetting.Setting.ContactEmail + "</a><BR/><BR/>  ")
            Me.sbBody.Append("  <B>Mailing Address:</B><BR/><BR/>  ")
            Me.sbBody.Append(WebSetting.Setting.WebSiteName + "<BR/>" + WebSetting.Setting("AddressLine1") + "<br/>" + WebSetting.Setting("AddressLine2") + "<br/><br/>")
            Me.sbBody.Append("<B> Should you have any questions concerning this order, please contact our toll-free support center at " + WebSetting.Setting.TollFreeTel + " during the hours of 7am-5pm PST, Monday through Friday.  You can also visit us on the Internet at  <a href=" + WebSetting.Setting("WebSiteURL") + ">www." + WebSetting.Setting.WebSiteName + "</a> <BR><BR>  ")
            Me.sbBody.Append("  Sincerely,<BR/><BR/><BR/><BR/>  ")
            Me.sbBody.Append("  Customer Support<BR/><a href=www." & WebSetting.Setting.WebSiteName & ">www." + WebSetting.Setting.WebSiteName + "</a><BR/><BR/>  ")
            Me.sbBody.Append("  ** This is an auto-generated message confirming your order.  Please do NOT respond directly to this email as you will not receive an email reply back.</B> ")
            Me.sbBody.Append("</body></html>")
            SendEmail(WebSetting.Setting.ContactEmail, strTo, WebSetting.Setting.WebSiteName & "- Order Confirmation", Me.sbBody.ToString(), True)
            'Dim message As New MailMessage(WebSetting.Setting("ContactEmail"), email, "www." & WebSetting.Setting("WebSiteName") & "- Order Confirmation", Me.sbBody.ToString())
            'message.IsBodyHtml = True
            'Dim smtp As New SmtpClient()
            'Try
            '    smtp.Send(message)
            'Catch ex As Exception
            '    Return False
            'End Try
            'Me.SendHttpPost(WebSetting.Setting("ContactEmail"), email, "www." & WebSetting.Setting("WebSiteName") & "- Order Confirmation", Me.sbBody.ToString())
        End Function

        Public Function SendForgetPasswordMail(ByVal email As String, ByVal username As String, ByVal password As String) As Boolean
            Dim websitename As String = WebSetting.Setting("WebSiteName").ToString()
            Dim sbBody As New StringBuilder()
            sbBody.Append("<html><body>")
            sbBody.Append("<font face=""arial""> <p><B>Dear " + websitename + " customer,</b></p><BR/><BR/>")
            sbBody.Append("  Your username/password for " + websitename + " is <BR/><BR/>Username: " + username + "<BR/>Password: " + password + "<BR/><BR/>")
            sbBody.Append("<strong>Should you have any questions, please do not hesitate to contact us toll-free at ")
            sbBody.Append(WebSetting.Setting("TollFreeTel").ToString())
            sbBody.Append(" during the hours of 7am-6pm PST, Monday through Friday, and 9am-2pm PST on Saturday.</strong><br/>")
            sbBody.Append("<br/><br/>")
            sbBody.Append("Sincerely,")
            sbBody.Append("<br/><br/><br/>")
            sbBody.Append("<strong>Customer Service</strong><br/>")
            sbBody.Append(websitename + "<br/><a href='" + websitename + "'>" + websitename + "</a><br/></font></body></html>")
            'Dim message As New MailMessage(WebSetting.Setting("ContactEmail").ToString(), email, websitename + " - Username/Password Request", sbBody.ToString())
            'message.IsBodyHtml = True
            'Dim smtp As New SmtpClient()
            'Try
            '    smtp.Send(message)
            'Catch ex As Exception
            '    Return False
            'End Try
            SendEmail(WebSetting.Setting.ContactEmail, email, websitename + " - Username/Password Request", sbBody.ToString(), True)
            Return True
        End Function
    End Class



    'Public Function SendBulkRequestEmail(strFrom As String,strDrugname As String,)
End Namespace
