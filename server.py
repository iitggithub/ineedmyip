import socket
import sys
import argparse

# Python script that sets up a based TCP socket
# and returns the IP addres of the client that connects to it
# Useful over websites such as whatsmyip.com etc as this bypasses
# HTTP and/or HTTPS proxies
# Requires python 2.7+

parser = argparse.ArgumentParser( \
    'Sets up a web socket that returns the client IP of anything that connects to it.')
parser.add_argument('-l', '--listen-address', default="0.0.0.0",
    action='store', help='The IP address on the server to bind to.')
parser.add_argument('-p', '--port', type=int, default="22", \
    action='store', help='The port to use. 22 is used to make it look like an SSH server.')

args = parser.parse_args()

sock = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
sock.bind((args.listen_address,args.port))
sock.listen(1)

while True:
    try:
        connection, client_address = sock.accept()
        if client_address:
            connection.sendall(str.encode(client_address[0] + "\n"))
    except KeyboardInterrupt:
        connection.close()
        sys.exit(0)
    finally:
        connection.close()
