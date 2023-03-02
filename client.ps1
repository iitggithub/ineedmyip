$server_address = "ineedmyip.com"
$port = 22

# If this is the first time running this script you may
# need to execute the following command in an administrator
# powershell prompt to allow unsigned powershell scripts to
# execute.
#
# Set-ExecutionPolicy unrestricted

try {
	$sock = New-Object System.Net.Sockets.TcpClient
	$sock.Connect($server_address, $port)
	$stream = $sock.GetStream()
	$buffer = New-Object System.Byte[] 1024
	$read = $stream.Read($buffer, 0, $buffer.Length)
	$data = [System.Text.Encoding]::ASCII.GetString($buffer, 0, $read)
	write-Output $data
}
finally {
	$sock.Close()
}
