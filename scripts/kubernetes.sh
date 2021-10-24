CNI_VERSION="v1.0.1"
CRICTL_VERSION="v1.22.0"
RELEASE_VERSION="v0.11.0"
DOWNLOAD_DIR=/opt/bin
RELEASE="v1.22.2"

mkdir -p /opt/cni/bin
mkdir -p /etc/systemd/system/kubelet.service.d

wget "https://github.com/containernetworking/plugins/releases/download/${CNI_VERSION}/cni-plugins-linux-amd64-${CNI_VERSION}.tgz" -O cni-plugins.tgz  
tar -xvf cni-plugins.tgz -C /opt/cni/bin
wget "https://github.com/kubernetes-sigs/cri-tools/releases/download/${CRICTL_VERSION}/crictl-${CRICTL_VERSION}-linux-amd64.tar.gz" -O crictl.tar.gz 
tar -xvf crictl.tar.gz -C $DOWNLOAD_DIR
wget "https://raw.githubusercontent.com/kubernetes/release/${RELEASE_VERSION}/cmd/kubepkg/templates/latest/deb/kubelet/lib/systemd/system/kubelet.service" -O kubelet.service 
sed -i "s:/usr/bin:${DOWNLOAD_DIR}:g" kubelet.service 
mv kubelet.service /etc/systemd/system/kubelet.service
wget "https://raw.githubusercontent.com/kubernetes/release/${RELEASE_VERSION}/cmd/kubepkg/templates/latest/deb/kubeadm/10-kubeadm.conf" -O 10-kubeadm.conf
sed -i "s:/usr/bin:${DOWNLOAD_DIR}:g" 10-kubeadm.conf
mv 10-kubeadm.conf /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
wget https://storage.googleapis.com/kubernetes-release/release/${RELEASE}/bin/linux/amd64/{kubeadm,kubelet,kubectl}

chmod +x {kubeadm,kubelet,kubectl}
mv {kubeadm,kubelet,kubectl} $DOWNLOAD_DIR/

systemctl enable --now kubelet
systemctl status kubelet