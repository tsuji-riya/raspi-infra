# client_certificate
kubectl config view --raw -o jsonpath='{.users[0].user.client-certificate-data}' | base64 -d > client.crt

# client_key
kubectl config view --raw -o jsonpath='{.users[0].user.client-key-data}' | base64 -d > client.key

# cluster_ca_certificate
kubectl config view --raw -o jsonpath='{.clusters[0].cluster.certificate-authority-data}' | base64 -d > ca.crt