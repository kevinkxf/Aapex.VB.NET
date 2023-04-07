Imports Microsoft.VisualBasic
Imports QSLib.Providers.LogProvider
Namespace Common
    Public Class Utilies
        Public Shared Function GetPriceMatchedPrice(ByVal fPrice As Decimal, ByVal fPriceBeat As Decimal, ByVal strUrl As String) As Decimal
            If String.IsNullOrEmpty(strUrl) OrElse fPrice <= fPriceBeat Then
                Return fPrice
            Else
                Dim fNewPrice As Decimal = fPriceBeat - (fPrice - fPriceBeat) * 0.1
                If fNewPrice < 0 Then
                    fNewPrice = 0
                End If
                Return fNewPrice
            End If
        End Function

        Public Shared Function ReadFile(ByVal strFileName As String) As Byte()
            Try
                Using fs As New IO.FileStream(strFileName, IO.FileMode.Open)
                    Dim oResult(fs.Length - 1) As Byte
                    fs.Read(oResult, 0, fs.Length)
                    Return oResult
                End Using
            Catch ex As Exception
                'Put message in trace
                Dim sb As New Text.StringBuilder()
                sb.AppendLine("Exception in DrugImage.ashx")
                sb.AppendLine("Message: " & ex.Message)
                If Not ex.InnerException Is Nothing Then
                    sb.AppendLine("Inner Message: " & ex.InnerException.Message)
                End If
                sb.AppendLine("Source: " & ex.Source)
                sb.AppendLine("Stack: " & ex.StackTrace)
                LoggerManager.LogError(sb.ToString)
                Return Nothing
            End Try
        End Function
    End Class
End Namespace
