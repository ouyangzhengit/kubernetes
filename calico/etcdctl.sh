ETCDCTL_API=3 /opt/etcd/bin/etcdctl \
--cacert=/opt/etcd/ssl/ca.pem \
--cert=/opt/etcd/ssl/server.pem \
--key=/opt/etcd/ssl/server-key.pem \
--endpoints=https://192.168.31.61:2379,https://192.168.31.62:2379,https://192.168.31.63:2379 \
$1
