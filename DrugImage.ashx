<%@ WebHandler Language="VB" Class="DrugImage" %>

Imports System
Imports System.Web
Imports QSLib.Entities
Imports QSLib.Providers.LogProvider
Imports Microsoft.Web

Public Class DrugImage
    Inherits ImageHandler
    
    Public Overrides Function GenerateImage(ByVal parameters As System.Collections.Specialized.NameValueCollection) As Microsoft.Web.ImageInfo
        Dim strDrugName As String = parameters("DrugName")
        If Not String.IsNullOrEmpty(strDrugName) Then
            Dim oDesc As Drugs.DrugDescriptionInfo = Drugs.DrugDescriptionController.GetDrugDescriptionByDrugname(strDrugName)
            If (oDesc Is Nothing) Then
                'No Description From DB,use default
                Try
                    Return New ImageInfo(Common.Utilies.ReadFile(HttpRuntime.AppDomainAppPath & "drugimages\image.jpg"))
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
                End Try
            ElseIf (Not oDesc Is Nothing AndAlso Not oDesc.Image Is Nothing AndAlso oDesc.Image.Length > 0) Then
                'Use Picture from DB
                Try
                    Return New ImageInfo(oDesc.Image)
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
                    Try
                        Return New ImageInfo(Common.Utilies.ReadFile(HttpRuntime.AppDomainAppPath & "drugimages\image.jpg"))
                    Catch ex1 As Exception
                        
                    End Try
                End Try
            ElseIf Not oDesc Is Nothing AndAlso Not String.IsNullOrEmpty(oDesc.ImageFileName) Then
                'Use Picture from local
                Try
                    Return New ImageInfo(Common.Utilies.ReadFile(HttpRuntime.AppDomainAppPath & "\" & oDesc.ImageFileName))
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
                    Try
                        Return Nothing
                    Catch ex1 As Exception
                        
                    End Try
                End Try
            End If
        End If
        Return New ImageInfo(Net.HttpStatusCode.BadRequest)
    End Function
    
    
End Class