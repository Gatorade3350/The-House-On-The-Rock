param(
    [string]$Root = (Get-Location).Path
)

$prefix = 'http://127.0.0.1:8000/'
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($prefix)
$listener.Start()
Write-Output "Serving $Root at $prefix"

while ($true) {
    $context = $listener.GetContext()
    $request = $context.Request
    $response = $context.Response

    $relativePath = $request.Url.LocalPath.TrimStart('/')
    if ([string]::IsNullOrEmpty($relativePath)) {
        $relativePath = 'index.html'
    }

    $filePath = Join-Path $Root $relativePath
    if (-not (Test-Path $filePath)) {
        $response.StatusCode = 404
        $content = [System.Text.Encoding]::UTF8.GetBytes('404 Not Found')
        $response.ContentLength64 = $content.Length
        $response.OutputStream.Write($content, 0, $content.Length)
        $response.OutputStream.Close()
        continue
    }

    $bytes = [System.IO.File]::ReadAllBytes($filePath)
    $response.ContentLength64 = $bytes.Length
    $response.ContentType = switch -Wildcard ($filePath) {
        '*.html' { 'text/html' }
        '*.htm' { 'text/html' }
        '*.css' { 'text/css' }
        '*.js' { 'application/javascript' }
        '*.png' { 'image/png' }
        '*.jpg' { 'image/jpeg' }
        '*.jpeg' { 'image/jpeg' }
        '*.gif' { 'image/gif' }
        '*.svg' { 'image/svg+xml' }
        '*.json' { 'application/json' }
        default { 'application/octet-stream' }
    }

    $response.OutputStream.Write($bytes, 0, $bytes.Length)
    $response.OutputStream.Close()
}
