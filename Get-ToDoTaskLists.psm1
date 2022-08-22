<#
 .Synopsis
    Return your ToDo Task Lists.

 .Description
    Return your ToDo Task Lists.. https://developer.microsoft.com/en-us/graph/graph-explorer?request=me&version=v1.0

 .Parameter AccessToken
  Authorization from AAD Logon

 .Example
   # Retrieves list of ToDo Task Lists..
   Get-ToDoTasks -AccessToken $AccessToken
#>



function Get-ToDoTaskLists
{
    param (
      [Parameter(Mandatory)]
      [string] $AccessToken)    

    $Uri = "https://graph.microsoft.com/v1.0/me/todo/lists"

    $results = curl.exe -X GET $Uri -H "Content-Type: application/json" -H "accept: application/json" -H "Authorization: Bearer $AccessToken" | ConvertFrom-Json

    return $results
}

Export-ModuleMember -Function Get-ToDoTaskLists

