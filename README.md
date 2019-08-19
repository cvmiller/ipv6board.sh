# Shell script to write short messages to [ipv6board](https://ipv6board.best-practice.se/)

## IPv6Board

IPv6Board is a cool little Raspberry Pi with a 8x3 display. There is a streaming [website](https://ipv6board.best-practice.se/) to see the output of the display.

### Writing messages to IPv6Board

Messages are written by crafting a ping to an address where the least significant 64 bits are ascii encoded text. From the website:

```
ping to 2001:6b0:1001:105:4177:6573:6f6d:6521 will print "Awesome!" to the board
```

But converting letters to ascii bytes by hand is tedious at best. But using a computer it becomes quite trivial.

### ipv6board.sh

Enter a small shell script which will convert text messages to ascii, create an IPv6 address to ping, and then ping that address, thus sending the message to the board. Makes sending your message a *snap*!

#### Running the script

```
$ ./ipv6board.sh -h
	./ipv6board.sh - write messages to ipv6board with ping6 
	e.g. ./ipv6board.sh "my msg" 
	-h  this help
```

```
$ ./ipv6board.sh "IPv6 Bd"
PING 2001:6b0:1001:105:4950:7636:2042:6420(2001:6b0:1001:105:4950:7636:2042:6420) 56 data bytes

--- 2001:6b0:1001:105:4950:7636:2042:6420 ping statistics ---
1 packets transmitted, 0 received, 100% packet loss, time 0ms

pau
```

![ipv6board](http://www.makikiweb.com/ipv6/_images/ipv6board_screen.png)


## Limitations


## Why Shell Script

Because it runs everywhere! Sure there are better languages for string manipulation, but the universality of shell scripts can't be beat.

## About the Script Author

Craig Miller has been an IPv6 advocate since 1998 when he then worked for Bay Networks. He has been working professionally in Telecom/Networking ever since. Look for his other OpenWRT projects, [v6 Brouter](https://github.com/cvmiller/v6brouter) a script to extend a /64 network (when upstream won't give you your own /64) and [v6disc](https://github.com/cvmiller/v6disc) an IPv6 discovery script.

<!-- Updated 18 August 2019 -->



