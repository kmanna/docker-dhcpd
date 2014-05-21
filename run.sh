#
# Create new docker containers and run them for the given subnets
#
PARENT_IFACE="em1"
VLANS="20 30 40"

#set -ex
for i in $VLANS; do
	name="dhcpd-vlan$i"
	net="192.168.$i.2/24"
	iface="$PARENT_IFACE.$i"

	# clean-up
	docker kill $name 2>/dev/null >/dev/null || true
	docker rm $name 2>/dev/null >/dev/null || true

	# start-up
	id=$(docker run -d --name=$name dhcpd)
	echo ">> Started container $name/$id"
	echo ">> Connecting pipework"

	# for some reason this returns 1...
	sudo ./pipework $iface $name $net
done
