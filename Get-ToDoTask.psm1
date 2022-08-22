<#
 .Synopsis
    Return your ToDo Task.

 .Description
    Return your ToDo Task. https://developer.microsoft.com/en-us/graph/graph-explorer?request=me&version=v1.0

 .Parameter AccessToken
  Authorization from AAD Logon

  .Parameter todoTaskListId
  Task List ID for specific Task

  .Parameter taskId
  Task ID for specific Task

   .Parameter AccessToken
  Authorization from AAD Logon

 .Example
   # Retrieves ToDo Task.
   Get-ToDoTasks -AccessToken $AccessToken -todoTaskListId $todoTaskListId -taskId $taskId
#>



function Get-ToDoTask
{
    param (      
    [Parameter(Mandatory)]
    [string] $AccessToken,
    [Parameter(Mandatory)]
    [string] $todoTaskListId,
    [Parameter(Mandatory)]
    [string] $taskId)     

    $Uri = "https://graph.microsoft.com/v1.0/me/todo/lists/$todoTaskListId/tasks/$taskId"

    $results = curl.exe -X GET $Uri -H "Content-Type: application/json" -H "accept: application/json" -H "Authorization: Bearer $AccessToken" | ConvertFrom-Json

    return $results
}

Export-ModuleMember -Function Get-ToDoTask

