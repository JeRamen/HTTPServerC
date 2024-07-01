all: server

server: server.c
	$(CC) server.c -o server -Wall -Werror -Wpedantic -Wextra -std=c99

rm:
	rm server
