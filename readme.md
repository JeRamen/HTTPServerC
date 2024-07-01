## Creating a simple HTTP server in C just for fun.
Using sockets, implement HTTP server in C.

### Socket Lifecycle
Socket creation:
```c
int socket(int socket_family, int socket_type, int protocol);

/*
Function creates endpoint for communication with specified socket_family, socket_type and protocol.

socket_family [int] - specifies a communication domain; selects a protocol family to be used
                      in communication. Example:
                                                AF_INET - IPv4
                                                AF_INET6 - IPv6
                                                AF_UNIX - local communication
                      
socket_type [int] - specifies the communication semantics. Example:
                                                SOCK_STREAM - reliable, connection-based
                                                SOCK_DGRAM - unreliable, connectionless

protocol [int] - specifies a particular protocol to be used with the socket.
                 Set to 0 to automatically select protocol depending on type.


Returns [int] - file descriptor that refers to that endpoint or '-1' for failure.
*/
```
Socket binding:
```c
int bind(int sockfd, const struct sockaddr *addr, socklen_t addrlen);

/*
Function assings the address specified by 'addr'.

sockfd [int] - file descriptor that refers to socket. Return value of 'socket' function. 

addr [struct sockaddr *] - pointer to address struct. 'sockaddr' only purpose is casting
                           different address structs to one type.

addrlen [socklen_t | unsigned int] - size of 'addr'.

Returns [int] - '0' or '-1' for failure. Sets errno to indicate the error.
*/
```
Listening:
```c
int listen(int socket, int backlog);

/*
Function marks a connection-mode socket, as accepting connections.

socket [int] - file descriptor that refers to socket. Return value of 'socket' function. 

backlog [int] - limit the about of connections in socket's listen queue.

Returns [int] - '0' or '-1' for failure. Sets errno to indicate the error.

*/
```
Accepting:
```c
int accept(int socket, struct sockaddr *restrict address, socklen_t *restrict address_len);

/*
Function will get first connection from queue of pending connections.

socket [int] - specifies a socket, that was connected, bound and is listening.

address [struct sockaddr | NULL] - null pointer or pointer to sockaddr struct that specifies
                                   the address of a connecting socket.

address_len [socklen_t | unsigned int] - null pointer or a pointer to size of address value.

Returns [int] - new socket descriptor of the accepted socket or '-1' for failure. Sets errno to indicate the error.
*/
```
Connecting:
```c
int connect(int socket, const struct sockaddr *address, socklen_t address_len);

/*
Function will attempt to make a connection with connection-mode socket.

socket [int] - specifies a socket.

address [struct sockaddr *] - pointer to address sctruct.

address_len [socklen_t | unsigned int] - size of address.

Returns [int] - '0' or '-1' for failure. Sets errno to indicate the error.
*/
```
Sending:
```c
ssize_t send(int socket, const void *buffer, size_t length, int flags);

/*
Function initiates transmition of a message from specified socket to its peers.

socket [int] - specifies a socket.

buffer [void *] - points to the buffer containing the message.

legnth [size_t] - size of buffer in bytes.

flags [int] - type of message transmition. Ex:
                                    MSG_EOR - terminates a record
                                    MSG_OOB
                                    MSG_NOSIGNAL
*/
```
Receiving:
```c
ssize_t recv(int socket, void *buffer, size_t length, int flags);

/*
Function shall receive a message from a socket.

socket [int] - specifies a socket.

buffer [void *] - points to the buffer where the message is to be stored.

legnth [size_t] - size of buffer in bytes.

flags [int] - type of message transmition. Ex:
                                    MSG_PEEK - Peeks at incoming message.
                                    MSG_OOB - Requests out-of-band data.
                                    MSG_WAITALL - on SOCK_STREAM this flag will
                                                  block the function until full 
                                                  package of data can be returned.
*/
```






