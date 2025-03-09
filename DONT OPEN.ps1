$webhook = Get-Content webhook.txt
$message = Get-Content message_test.txt
$msg = @{ "content" = $message } | ConvertTo-Json -Depth 1
Invoke-RestMethod -Uri $webhook -Method Post -ContentType "application/json" -Body $msg
