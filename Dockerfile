# Pull base image.
FROM ubuntu:14.04

# Update Ubuntu
RUN apt-get update && apt-get dist-upgrade -y
#RUN apt-get install -y dnsmasq tcpdump
RUN apt-get install -y isc-dhcp-server

# Install helpers
ADD dhcpd.conf /etc/dhcp/
ADD pipework /usr/bin/pipework

# Define default command.
#CMD ["dnsmasq", "--keep-in-foreground", "--user=root", "--bind-dynamic", "--except-interface=eth0", "--conf-dir=/etc/dnsmasq.d"]
# Wait for pipework to run on the host to bridge the interfaces and then launch dhcpd,
# Better to have a long cmd line here then a shells cript
CMD pipework --wait -i eth1 && dhcpd -f eth1

# Expose ports.
EXPOSE 67/udp
