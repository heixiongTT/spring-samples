### root
rm -rf ca*

openssl ecparam -name prime256v1 -genkey -out ca-key_.pem

openssl pkcs8 -inform PEM -outform PEM -topk8 -nocrypt -in ca-key_.pem -out ca-key.pem

openssl req -config openssl-root.conf -new -key ca-key.pem -out ca-cert-req.csr

openssl x509 -req -sha256 -extfile openssl-root.conf -extensions usr_cert  -in ca-cert-req.csr -out ca-cert.pem -signkey ca-key.pem  -CAcreateserial -days 3650