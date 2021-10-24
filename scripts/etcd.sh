sudo chown -R devops:devops /opt

mkdir -p /opt/bin
sudo mkdir -p /var/cache/etcdadm/etcd/v3.5.1

wget https://github.com/kubernetes-sigs/etcdadm/releases/download/v0.1.5/etcdadm-linux-amd64 -O /opt/bin/etcdadm
wget https://github.com/etcd-io/etcd/releases/download/v3.5.1/etcd-v3.5.1-linux-amd64.tar.gz -O etcd-v3.5.1-linux-amd64.tar.gz
sudo mv etcd-v3.5.1-linux-amd64.tar.gz /var/cache/etcdadm/etcd/v3.5.1/etcd-v3.5.1-linux-amd64.tar.gz