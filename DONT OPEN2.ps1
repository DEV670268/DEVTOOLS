$webhook = Get-Content webhook.txt
$spam_msg = Get-Content message_spam.txt
$spam_count = Get-Content spam_count.txt
$msg = @{ "content" = $spam_msg } | ConvertTo-Json -Depth 1

for ($i = 1; $i -le $spam_count; $i++) {
    Invoke-RestMethod -Uri $webhook -Method Post -ContentType "application/json" -Body $msg
    Start-Sleep -Milliseconds 500
}
