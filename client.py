import socket
import sys

server_address = "ineedmyip.com"
port = 2222

sock = socket.socket(socket.AF_INET,socket.SOCK_STREAM)

sock.connect((server_address, port))

try:
    client_address = sock.recv(1024)
    sys.stdout.write(client_address.decode())
finally:
    sock.close()
