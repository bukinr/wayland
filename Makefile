all:
	wayland-scanner private-code < /usr/local/share/wayland-protocols/stable/xdg-shell/xdg-shell.xml > xdg-shell-protocol.c
	wayland-scanner client-header < /usr/local/share/wayland-protocols/stable/xdg-shell/xdg-shell.xml > xdg-shell-client-protocol.h
	cc -I/usr/local/include -c client.c
	cc -I/usr/local/include -c xdg-shell-protocol.c
	cc xdg-shell-protocol.o client.o -L/usr/local/lib -lwayland-client -o client

clean:
	rm -f xdg-shell-protocol.* xdg-shell-client-protocol.h client.o client

