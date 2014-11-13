#!/bin/bash

function createNamespace {
	$(ip net add $1)
}

function createNamespaces {
	for x in $@; do
		createNamespace $x
	done
}

function execInNamespace {
	$(ip net e $1 $2)
}

# creating namespaces
createNamespaces "h2" "h3" "h4"

#creating link between h2 and Ubuntu
ip link add veth0 type veth peer name veth2
ip link set dev veth2 netns h2

#creating VLANs in h2
execInNamespace "h2" "ip l a link veth2 name veth2.10 type vlan id 10"
execInNamespace "h2" "ip l a link veth2 name veth2.20 type vlan id 20"

#adding IP to VLANs
execInNamespace "h2" "ip a a 10.0.0.2/24 dev veth2.10"
execInNamespace "h2" "ip a a 20.0.0.2/24 dev veth2.20"

#up interfaces 
ip l s lo up
ip l s veth0 up
execInNamespace "h2" "ip l s lo up"
execInNamespace "h2" "ip l s veth2 up"

#up VLANs
execInNamespace "h2" "ip l s veth2.10 up"
execInNamespace "h2" "ip l s veth2.20 up"

route add -net 10.0.0.0/24 gw 10.0.0.1 dev veth2
#route add -net 20.0.0.2/24 gw 20.0.0.1 dev veth2

#creating bridge and adding interface
brctl addbr br10
brctl addif br10 veth0

#creating VLANs in bridge
#ip l a link br10 name br10.10 type vlan id 10
#ip l a link br10 name br10.20 type vlan id 20

#up bridge
ifconfig br10 10.0.0.1 up
# ifconfig br10 20.0.0.1 up