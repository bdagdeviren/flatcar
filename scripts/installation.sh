echo $ETCD $BASE $CHMOD

sudo chown -R devops:devops /opt

mkdir -p /opt/bin

if [[ "$ETCD" == "true" ]] 
then
    sudo mkdir -p /var/cache/etcdadm/etcd/v3.5.1
    #Etcdadm Installation
	wget https://github.com/kubernetes-sigs/etcdadm/releases/download/v0.1.5/etcdadm-linux-amd64 -O /opt/bin/etcdadm
	#Etcd Installation
	wget https://github.com/etcd-io/etcd/releases/download/v3.5.1/etcd-v3.5.1-linux-amd64.tar.gz -O etcd-v3.5.1-linux-amd64.tar.gz
	sudo mv etcd-v3.5.1-linux-amd64.tar.gz /var/cache/etcdadm/etcd/v3.5.1/etcd-v3.5.1-linux-amd64.tar.gz
fi

if [[ "$BASE" == "true" ]] 
then
	#Gotop Installation
	wget -O - https://github.com/cjbassi/gotop/releases/download/3.0.0/gotop_3.0.0_linux_amd64.tgz | tar -xzf -
	mv gotop /opt/bin/gotop
	#Nano Installation
	wget https://raw.githubusercontent.com/andrew-d/static-binaries/master/binaries/linux/x86_64/nano -O /opt/bin/nano
fi

if [[ "$CHMOD" == "true" ]] 
then
	chmod +x /opt/bin/*
fi