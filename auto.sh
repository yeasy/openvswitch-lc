sudo kill `cd /usr/local/var/run/openvswitch && cat ovsdb-server.pid ovs-vswitchd.pid`;
sudo rmmod openvswitch;
sudo modprobe -r openvswitch;
sleep 1;
make && sudo make install && sudo insmod datapath/linux/openvswitch.ko && sudo ovsdb-server --remote=punix:/usr/local/var/run/openvswitch/db.sock --remote=db:Open_vSwitch,manager_options --private-key=db:SSL,private_key --certificate=db:SSL,certificate --bootstrap-ca-cert=db:SSL,ca_cert --pidfile --detach; 

sleep 1;

sudo ovs-vsctl --no-wait init; sleep 1; sudo ovs-vswitchd --pidfile --detach; sleep 1;

sudo route del default gw 192.168.56.1; sudo route del default gw 192.168.57.1; sudo route del default gw 192.168.58.1; 
sudo route add -host 239.0.0.1 dev eth1;
sudo ifconfig eth2 0;
sudo ifconfig br0 192.168.58.10 up; #edge sw2
sudo ip addr add 10.0.0.2/24 brd 10.0.0.255 dev br0 #test host2

sudo sysctl -w net.ipv4.neigh.default.gc_stale_time=600
sudo sysctl -w net.ipv4.neigh.br0.gc_stale_time=600
sudo arp -s 10.0.0.1 08:00:27:85:ca:de
sudo arp -s 192.168.58.1 0a:00:27:00:00:02 
