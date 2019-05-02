


## find the names of your interfaces

    ls /sys/class/net/ 



## Using DHCP to automatically configure the interface

    auto eth0
    allow-hotplug eth0
    iface eth0 inet dhcp

#### for ipv6 dhcp
    
    iface eth0 inet6 dhcp

#### for ipv6 stateless address autoconfiguration
    
    iface eth0 inet6 auto


## Using Static configuration

    auto eth0
    iface eth0 inet static
        address 192.0.2.7/24
        gateway 192.0.2.254

#### for static ipv6

    iface eth0 inet6 static
        address 2001:db8::c0ca:1eaf/64
        gateway 2001:db8::1ead:ed:beef

Mixing manual and automatic configuration is also possible, e.g. to use IPv6 SLAAC for internet connectivity and static addresses within the network:

#### manual unique local address

    iface eth0 inet6 static
        address fdc3:cafe::3/64
        # use SLAAC to get global IPv6 address from the router
        # we may not enable ipv6 forwarding, otherwise SLAAC gets disabled
        autoconf 1
        accept_ra 2



## Defining (DNS) Nameserver

nameserver configuration is in the file /etc/resolv.conf

    nano /etc/resolv.conf

example1

    nameserver 12.34.56.78
    nameserver 12.34.56.79

example2

    nameserver 1.1.1.1
    nameserver 8.8.8.8


## Bridging

puts multiple interfaces into the same network segment

    auto br0
    iface br0 inet static
        address 10.10.0.15/24
        gateway 10.10.0.1
        bridge_ports eth0 eth1
        up /usr/sbin/brctl stp br0 on

bridge without ip address configuration to forward an interface to a guest vm

    auto br1
    iface br1 inet manual
        bridge_ports eth4
        up /usr/sbin/brctl setageing br1 0
        up /usr/sbin/brctl stp br0 off


## Multiple IP addresses on one Interface

### Legacy method

    auto eth0
    allow-hotplug eth0
    iface eth0 inet static
        address 192.168.1.42/24
        gateway 192.168.1.1

    auto eth0:0
    allow-hotplug eth0:0
    iface eth0:0 inet static
        address 192.168.1.43/24

    auto eth0:1
    allow-hotplug eth0:1
    iface eth0:1 inet static
        address 192.168.1.44/24
















