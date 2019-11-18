
### admin
rm -rf admin*
openssl ecparam -name prime256v1 -genkey -out admin_sk

openssl pkcs8 -inform PEM -outform PEM -topk8 -nocrypt -in admin_sk -out admin-cert_sk

openssl req -config openssl.conf -new -key admin-cert_sk -keyform pem -out admin-ca.csr

openssl x509 -req -sha256 -extfile openssl.conf -extensions usr_cert -in admin-ca.csr -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -days 3650 -out admin-aa.pem

### peer0
rm -rf peer*
openssl ecparam -name prime256v1 -genkey -out peer0_sk

openssl pkcs8 -inform PEM -outform PEM -topk8 -nocrypt -in peer0_sk -out peer0-cert_sk

openssl req -config openssl.conf -new -key peer0-cert_sk -keyform pem -out peer0-ca.csr

openssl x509 -req -sha256 -extfile openssl.conf -extensions usr_cert -in peer0-ca.csr -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -days 3650 -out peer0-aa.pem

### peer1
openssl ecparam -name prime256v1 -genkey -out peer1_sk

openssl pkcs8 -inform PEM -outform PEM -topk8 -nocrypt -in peer1_sk -out peer1-cert_sk

openssl req -config openssl.conf -new -key peer1-cert_sk -keyform pem -out peer1-ca.csr

openssl x509 -req -sha256 -extfile openssl.conf -extensions usr_cert -in peer1-ca.csr  -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -days 3650 -out peer1-aa.pem
