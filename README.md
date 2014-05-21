docker-dhcpd
============

Run DHCPD in a docker instance and manage multiple vlans (one per container).  This is currently very hacky because there is no easy way to tell Docker to bridge an interface or setup a macvlan other then using pipework.  Hopefully this will be resolved in the future.

Build Docker Image
------------------

    $ cp dhcpd.conf.sample dhcpd.conf
    $ docker build -t=dhcpd .
