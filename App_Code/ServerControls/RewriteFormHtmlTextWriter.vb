﻿Imports Microsoft.VisualBasic
Namespace ServerControls
    Public Class RewriteFormHtmlTextWriter
        Inherits HtmlTextWriter

        Sub New(ByVal writer As HtmlTextWriter)
            MyBase.New(writer)
            Me.InnerWriter = writer.InnerWriter
        End Sub

        Sub New(ByVal writer As System.IO.TextWriter)
            MyBase.New(writer)
            MyBase.InnerWriter = writer
        End Sub

        Public Overrides Sub WriteAttribute(ByVal name As String, ByVal value As String, ByVal fEncode As Boolean)

            ' If the attribute we are writing is the "action" attribute, and we are not on a sub-control, 
            ' then replace the value to write with the raw URL of the request - which ensures that we'll
            ' preserve the PathInfo value on postback scenarios

            If (name = "action") Then

                Dim Context As HttpContext
                Context = HttpContext.Current

                If Context.Items("ActionAlreadyWritten") Is Nothing Then

                    ' Because we are using the UrlRewriting.net HttpModule, we will use the 
                    ' Request.RawUrl property within ASP.NET to retrieve the origional URL
                    ' before it was re-written.  You'll want to change the line of code below
                    ' if you use a different URL rewriting implementation.

                    value = Context.Request.RawUrl

                    ' Indicate that we've already rewritten the <form>'s action attribute to prevent
                    ' us from rewriting a sub-control under the <form> control

                    Context.Items("ActionAlreadyWritten") = True

                End If

            End If

            MyBase.WriteAttribute(name, value, fEncode)

        End Sub

    End Class
End Namespace

