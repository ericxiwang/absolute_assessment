on the kvm hosting server
1.start SimpleHTTPServer
	python -m SimpleHTTPServer
2.create vm with parameters
	./vm-creator.py --hostname mysql1.local --ip 192.168.1.100 --vcpu 2 --disk 50 --ram 4096 --iso /tmp/UbuntXXXu.iso

3.wait for a while, check the list of VMs via command line:
	virsh list
