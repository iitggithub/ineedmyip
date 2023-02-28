import socket
import sys

server_address = "ineedmyip.com"
port = 22

sock = socket.socket(socket.AF_INET,socket.SOCK_STREAM)

try:
    sock.settimeout(10)
    sock.connect((server_address, port))
    client_address = sock.recv(1024)
    sys.stdout.write(client_address.decode())
except socket.timeout:
    sys.stdout.write("Timeout connecting to server.\n")
finally:
    sock.close()
