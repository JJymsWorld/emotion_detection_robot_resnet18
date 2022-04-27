import bluetooth
import sys
import time
import threading

# server_socket = None
#
# def serveSocket(sock, info):
#     while True:
#         receive = sock.recv(1024).decode('utf-8')
#         print('[' + str(info) + ']' + receive)
#         receive = receive + '\n'
#         sock.send(receive.encode('utf-8'))
#
# server_socket = bluetooth.BluetoothSocket(bluetooth.RFCOMM)
# server_socket.bind(("", 1))
# server_socket.listen(1)
#
# while True:
#     sock, info = server_socket.accept()
#     print(str(info[0]) + ' Connected!')
#     t = threading.Thread(target=server_socket, args=(sock, info[0]))
#     t.setDaemon(True)
#     t.start()
#
#

from bluetooth import *

server_sock = BluetoothSocket(RFCOMM)
server_sock.bind(("", PORT_ANY))
server_sock.listen(1)

port = server_sock.getsockname()[1]

uuid = "94f39d29-7d6d-437d-973b-fba39e49d4ee"

advertise_service(server_sock, "SampleServer",
                  service_id=uuid,
                  service_classes=[uuid, SERIAL_PORT_CLASS],
                  profiles=[SERIAL_PORT_PROFILE],
                  #                   protocols = [ OBEX_UUID ]
                  )

print("Waiting for connection on RFCOMM channel %d" % port)

client_sock, client_info = server_sock.accept()
print("Accepted connection from ", client_info)

try:
    while True:
        data = client_sock.recv(1024)
        if str(data.decode()) == '0':
            client_sock.send("verify 0")
        if len(data) == 0: break
        print("received [%s]" % data.decode())
except IOError:
    pass

print("disconnected")

client_sock.close()
server_sock.close()
