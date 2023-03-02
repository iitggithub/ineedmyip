$server_address = "ineedmyip.com"
$port = 22

# If this is the first time running this script you may
# need to execute the following command in an administrator
# powershell prompt to allow powershell scripts to
# be executed.
#
# Set-ExecutionPolicy unrestricted
#
# For more information on Powershell execution policies,
# see the following link:
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.3

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
