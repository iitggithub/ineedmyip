$server_address = "ineedmyip.com"
$port = 22

try {
	$sock = New-Object System.Net.Sockets.TcpClient
	$sock.ConnectTimeout(10000) # 10 second connection timeout
	$sock.Connect($server_address, $port)
	$stream = $sock.GetStream()
	$buffer = New-Object System.Byte[] 1024
	$read = $stream.Read($buffer, 0, $buffer.Length)
	write-Output [System.Text.Encoding]::ASCII.GetString($buffer, 0, $read)
}
finally {
	$sock.Close()
}
