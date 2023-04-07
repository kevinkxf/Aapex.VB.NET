Imports Microsoft.VisualBasic
Namespace ServerControls
    Public Class FormRewriterControlAdapter
        Inherits System.Web.UI.Adapters.ControlAdapter

        Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
            MyBase.Render(New RewriteFormHtmlTextWriter(writer))
        End Sub

    End Class
End Namespace

