
[root@k8s-master ~]# cd /etc/kubernetes/pki/
[root@k8s-master pki]# mkdir ui
[root@k8s-master pki]# cp apiserver.crt ui/
[root@k8s-master pki]# cp apiserver.key ui/
[root@k8s-master pki]# cd ui/
[root@k8s-master ui]# mv apiserver.crt dashboard.pem
[root@k8s-master ui]# mv apiserver.key dashboard-key.pem

1、 删除默认的secret，用自签证书创建新的secret
kubectl delete secret kubernetes-dashboard-certs -n kube-system
kubectl create secret generic kubernetes-dashboard-certs --from-file=./ -n kube-system

2、修改 dashboard-controller.yaml 文件，在args下面增加证书两行
       args:
         # PLATFORM-SPECIFIC ARGS HERE
         - --auto-generate-certificates
         - --tls-key-file=dashboard-key.pem
         - --tls-cert-file=dashboard.pem

3、应用更新
kubectl apply -f dashboard.yaml
