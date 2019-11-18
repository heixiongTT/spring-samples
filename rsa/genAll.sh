rm -rf $(find  /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config -name "*.pem")
rm -rf $(find  /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config -name "*_sk")
rm -rf $(find  /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config -name "*.crt")
rm -rf $(find  /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config -name "*.key")
for (( i = 1; i < 3; i++ )); do

		cp -rf openssl-root.temp openssl-root.conf
		sed -i "" "s/CCCCNNNN/ca.org$i.example.com/g" openssl-root.conf
		sed -i "" "s/OOOO/org$i.example.com/g" openssl-root.conf

	rm -rf ca*

	openssl genrsa -out ca-key_.pem 2048

	openssl pkcs8 -inform PEM -outform PEM -topk8 -nocrypt -in ca-key_.pem -out ca-key.pem

	openssl req -config openssl-root.conf -new -key ca-key.pem -out ca-cert-req.csr

	openssl x509 -req -sha256 -extfile openssl-root.conf -extensions usr_cert  -in ca-cert-req.csr -out ca-cert.pem -signkey ca-key.pem  -CAcreateserial -days 3650

		cp -rf openssl.temp openssl.conf
		sed -i "" "s/CCCCNNNN/admin@org$i.example.com/g" openssl.conf
		sed -i "" "s/OOOOUUUU/OU=client/g" openssl.conf

		rm -rf admin*
		openssl genrsa -out admin_sk 2048

		openssl pkcs8 -inform PEM -outform PEM -topk8 -nocrypt -in admin_sk -out admin-cert_sk

		openssl req -config openssl.conf -new -key admin-cert_sk -keyform pem -out admin-ca.csr

		openssl x509 -req -sha256 -extfile openssl.conf -extensions usr_cert -in admin-ca.csr -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -days 3650 -out admin-aa.pem

		cp -rf openssl.temp openssl.conf
		sed -i "" "s/CCCCNNNN/peer0.org$i.example.com/g" openssl.conf
		sed -i "" "s/OOOOUUUU/OU=peer/g" openssl.conf
		### peer0
		rm -rf peer*
		openssl genrsa -out peer0_sk 2048

		openssl pkcs8 -inform PEM -outform PEM -topk8 -nocrypt -in peer0_sk -out peer0-cert_sk

		openssl req -config openssl.conf -new -key peer0-cert_sk -keyform pem -out peer0-ca.csr

		openssl x509 -req -sha256 -extfile openssl.conf -extensions usr_cert -in peer0-ca.csr -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -days 3650 -out peer0-aa.pem

		cp -rf openssl.temp openssl.conf
		sed -i "" "s/CCCCNNNN/peer1.org$i.example.com/g" openssl.conf
		sed -i "" "s/OOOOUUUU/OU=peer/g" openssl.conf
		### peer1
		openssl genrsa -out peer1_sk 2048

		openssl pkcs8 -inform PEM -outform PEM -topk8 -nocrypt -in peer1_sk -out peer1-cert_sk

		openssl req -config openssl.conf -new -key peer1-cert_sk -keyform pem -out peer1-ca.csr

		openssl x509 -req -sha256 -extfile openssl.conf -extensions usr_cert -in peer1-ca.csr  -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -days 3650 -out peer1-aa.pem

		rm -rf ../crypto-config/peerOrganizations/org$i.example.com/ca/ca.org$i.example.com-cert.pem
		rm -rf ../crypto-config/peerOrganizations/org$i.example.com/msp/cacerts/ca.org$i.example.com-cert.pem
		rm -rf ../crypto-config/peerOrganizations/org$i.example.com/users/Admin@org$i.example.com/msp/cacerts/ca.org$i.example.com-cert.pem
		rm -rf ../crypto-config/peerOrganizations/org$i.example.com/peers/peer1.org$i.example.com/msp/cacerts/ca.org$i.example.com-cert.pem
		rm -rf ../crypto-config/peerOrganizations/org$i.example.com/peers/peer0.org$i.example.com/msp/cacerts/ca.org$i.example.com-cert.pem

		cp ca-cert.pem ../crypto-config/peerOrganizations/org$i.example.com/ca/ca.org$i.example.com-cert.pem
		cp ca-cert.pem ../crypto-config/peerOrganizations/org$i.example.com/msp/cacerts/ca.org$i.example.com-cert.pem
		cp ca-cert.pem ../crypto-config/peerOrganizations/org$i.example.com/users/Admin@org$i.example.com/msp/cacerts/ca.org$i.example.com-cert.pem
		cp ca-cert.pem ../crypto-config/peerOrganizations/org$i.example.com/peers/peer1.org$i.example.com/msp/cacerts/ca.org$i.example.com-cert.pem
		cp ca-cert.pem ../crypto-config/peerOrganizations/org$i.example.com/peers/peer0.org$i.example.com/msp/cacerts/ca.org$i.example.com-cert.pem


		rm -rf ../crypto-config/peerOrganizations/org$i.example.com/msp/admincerts/Admin@org$i.example.com-cert.pem
		rm -rf ../crypto-config/peerOrganizations/org$i.example.com/users/Admin@org$i.example.com/msp/admincerts/Admin@org$i.example.com-cert.pem
		rm -rf ../crypto-config/peerOrganizations/org$i.example.com/users/Admin@org$i.example.com/msp/signcerts/Admin@org$i.example.com-cert.pem
		rm -rf ../crypto-config/peerOrganizations/org$i.example.com/peers/peer1.org$i.example.com/msp/admincerts/Admin@org$i.example.com-cert.pem
		rm -rf ../crypto-config/peerOrganizations/org$i.example.com/peers/peer0.org$i.example.com/msp/admincerts/Admin@org$i.example.com-cert.pem

		cp admin-aa.pem ../crypto-config/peerOrganizations/org$i.example.com/msp/admincerts/Admin@org$i.example.com-cert.pem
		cp admin-aa.pem ../crypto-config/peerOrganizations/org$i.example.com/users/Admin@org$i.example.com/msp/admincerts/Admin@org$i.example.com-cert.pem
		cp admin-aa.pem ../crypto-config/peerOrganizations/org$i.example.com/users/Admin@org$i.example.com/msp/signcerts/Admin@org$i.example.com-cert.pem
		cp admin-aa.pem ../crypto-config/peerOrganizations/org$i.example.com/peers/peer1.org$i.example.com/msp/admincerts/Admin@org$i.example.com-cert.pem
		cp admin-aa.pem ../crypto-config/peerOrganizations/org$i.example.com/peers/peer0.org$i.example.com/msp/admincerts/Admin@org$i.example.com-cert.pem

		rm -rf ../crypto-config/peerOrganizations/org$i.example.com/peers/peer0.org$i.example.com/msp/signcerts/peer0.org$i.example.com-cert.pem
		rm -rf ../crypto-config/peerOrganizations/org$i.example.com/peers/peer1.org$i.example.com/msp/signcerts/peer1.org$i.example.com-cert.pem
		cp peer0-aa.pem ../crypto-config/peerOrganizations/org$i.example.com/peers/peer0.org$i.example.com/msp/signcerts/peer0.org$i.example.com-cert.pem
		cp peer1-aa.pem ../crypto-config/peerOrganizations/org$i.example.com/peers/peer1.org$i.example.com/msp/signcerts/peer1.org$i.example.com-cert.pem

		cp -rf ca-key.pem ../crypto-config/peerOrganizations/org$i.example.com/ca/ca-key_sk
		cp -rf admin-cert_sk ../crypto-config/peerOrganizations/org$i.example.com/users/Admin@org$i.example.com/msp/keystore/
		cp -rf peer1-cert_sk ../crypto-config/peerOrganizations/org$i.example.com/peers/peer1.org$i.example.com/msp/keystore/
		cp -rf peer0-cert_sk ../crypto-config/peerOrganizations/org$i.example.com/peers/peer0.org$i.example.com/msp/keystore/

done

for (( i = 1; i < 3; i++ )); do

		cp -rf openssl-root.temp openssl-root.conf
		sed -i "" "s/CCCCNNNN/tlsca.org$i.example.com/g" openssl-root.conf
		sed -i "" "s/OOOO/org$i.example.com/g" openssl-root.conf
	rm -rf ca*

	openssl genrsa -out ca-key_.pem 2048

	openssl pkcs8 -inform PEM -outform PEM -topk8 -nocrypt -in ca-key_.pem -out ca-key.pem

	openssl req -config openssl-root.conf -new -key ca-key.pem -out ca-cert-req.csr

	openssl x509 -req -sha256 -extfile openssl-root.conf -extensions usr_cert  -in ca-cert-req.csr -out ca-cert.pem -signkey ca-key.pem  -CAcreateserial -days 3650

	rm -rf ../crypto-config/peerOrganizations/org$i.example.com/users/Admin@org$i.example.com/tls/ca.crt
	rm -rf ../crypto-config/peerOrganizations/org$i.example.com/peers/peer1.org$i.example.com/tls/ca.crt
	rm -rf ../crypto-config/peerOrganizations/org$i.example.com/peers/peer0.org$i.example.com/tls/ca.crt

	cp ca-cert.pem ../crypto-config/peerOrganizations/org$i.example.com/users/Admin@org$i.example.com/tls/ca.crt
	cp ca-cert.pem ../crypto-config/peerOrganizations/org$i.example.com/peers/peer1.org$i.example.com/tls/ca.crt
	cp ca-cert.pem ../crypto-config/peerOrganizations/org$i.example.com/peers/peer0.org$i.example.com/tls/ca.crt

	rm -rf ../crypto-config/peerOrganizations/org$i.example.com/tlsca/tlsca.org$i.example.com-cert.pem
	rm -rf ../crypto-config/peerOrganizations/org$i.example.com/msp/tlscacerts/tlsca.org$i.example.com-cert.pem
	rm -rf ../crypto-config/peerOrganizations/org$i.example.com/users/Admin@org$i.example.com/msp/tlscacerts/tlsca.org$i.example.com-cert.pem
	rm -rf ../crypto-config/peerOrganizations/org$i.example.com/peers/peer1.org$i.example.com/msp/tlscacerts/tlsca.org$i.example.com-cert.pem
	rm -rf ../crypto-config/peerOrganizations/org$i.example.com/peers/peer0.org$i.example.com/msp/tlscacerts/tlsca.org$i.example.com-cert.pem

	cp ca-cert.pem ../crypto-config/peerOrganizations/org$i.example.com/tlsca/tlsca.org$i.example.com-cert.pem
	cp ca-cert.pem ../crypto-config/peerOrganizations/org$i.example.com/msp/tlscacerts/tlsca.org$i.example.com-cert.pem
	cp ca-cert.pem ../crypto-config/peerOrganizations/org$i.example.com/users/Admin@org$i.example.com/msp/tlscacerts/tlsca.org$i.example.com-cert.pem
	cp ca-cert.pem ../crypto-config/peerOrganizations/org$i.example.com/peers/peer1.org$i.example.com/msp/tlscacerts/tlsca.org$i.example.com-cert.pem
	cp ca-cert.pem ../crypto-config/peerOrganizations/org$i.example.com/peers/peer0.org$i.example.com/msp/tlscacerts/tlsca.org$i.example.com-cert.pem

		cp -rf tls.temp tls.conf
		sed -i "" "s/TTTTEEEEMMMMPPPP//g" tls.conf
		sed -i "" "s/CCCCNNNN/Admin@org$i.example.com/g" tls.conf


		rm -rf admin*
		openssl genrsa -out admin_sk 2048

		openssl pkcs8 -inform PEM -outform PEM -topk8 -nocrypt -in admin_sk -out admin-cert_sk

		openssl req -config tls.conf -new -key admin-cert_sk -keyform pem -out admin-ca.csr

		openssl x509 -req -sha256 -extfile tls.conf -extensions usr_cert -in admin-ca.csr -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -days 3650 -out admin-aa.pem


		cp -rf tls.temp tls.conf
		sed -i "" "s/TTTTEEEEMMMMPPPP/subjectAltName=DNS:peer0.org$i.example.com, DNS:peer0/g" tls.conf
		sed -i "" "s/CCCCNNNN/peer0.org$i.example.com/g" tls.conf
		### peer0
		rm -rf peer*
		openssl genrsa -out peer0_sk 2048

		openssl pkcs8 -inform PEM -outform PEM -topk8 -nocrypt -in peer0_sk -out peer0-cert_sk

		openssl req -config tls.conf -new -key peer0-cert_sk -keyform pem -out peer0-ca.csr

		openssl x509 -req -sha256 -extfile tls.conf -extensions usr_cert -in peer0-ca.csr -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -days 3650 -out peer0-aa.pem


		cp -rf tls.temp tls.conf
		sed -i "" "s/TTTTEEEEMMMMPPPP/subjectAltName=DNS:peer1.org$i.example.com, DNS:peer1/g" tls.conf
		sed -i "" "s/CCCCNNNN/peer1.org$i.example.com/g" tls.conf
		### peer1
		openssl genrsa -out peer1_sk 2048

		openssl pkcs8 -inform PEM -outform PEM -topk8 -nocrypt -in peer1_sk -out peer1-cert_sk

		openssl req -config tls.conf -new -key peer1-cert_sk -keyform pem -out peer1-ca.csr

		openssl x509 -req -sha256 -extfile tls.conf -extensions usr_cert -in peer1-ca.csr  -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -days 3650 -out peer1-aa.pem


		cp -rf ca-key.pem ../crypto-config/peerOrganizations/org$i.example.com/tlsca/ca-key_sk

		rm -rf ../crypto-config/peerOrganizations/org$i.example.com/users/Admin@org$i.example.com/tls/client.key
		rm -rf ../crypto-config/peerOrganizations/org$i.example.com/peers/peer1.org$i.example.com/tls/server.key
		rm -rf ../crypto-config/peerOrganizations/org$i.example.com/peers/peer0.org$i.example.com/tls/server.key

		cp admin-cert_sk ../crypto-config/peerOrganizations/org$i.example.com/users/Admin@org$i.example.com/tls/client.key
		cp peer1-cert_sk ../crypto-config/peerOrganizations/org$i.example.com/peers/peer1.org$i.example.com/tls/server.key
		cp peer0-cert_sk ../crypto-config/peerOrganizations/org$i.example.com/peers/peer0.org$i.example.com/tls/server.key

		rm -rf ../crypto-config/peerOrganizations/org$i.example.com/users/Admin@org$i.example.com/tls/client.crt
		rm -rf ../crypto-config/peerOrganizations/org$i.example.com/peers/peer1.org$i.example.com/tls/server.crt
		rm -rf ../crypto-config/peerOrganizations/org$i.example.com/peers/peer0.org$i.example.com/tls/server.crt


		cp admin-aa.pem ../crypto-config/peerOrganizations/org$i.example.com/users/Admin@org$i.example.com/tls/client.crt
		cp peer1-aa.pem ../crypto-config/peerOrganizations/org$i.example.com/peers/peer1.org$i.example.com/tls/server.crt
		cp peer0-aa.pem ../crypto-config/peerOrganizations/org$i.example.com/peers/peer0.org$i.example.com/tls/server.crt

done


for (( i = 1; i < 2; i++ )); do

		cp -rf openssl-root.temp openssl-root.conf
		sed -i "" "s/CCCCNNNN/ca.example.com/g" openssl-root.conf
		sed -i "" "s/OOOO/example.com/g" openssl-root.conf
	rm -rf ca*

	openssl genrsa -out ca-key_.pem 2048

	openssl pkcs8 -inform PEM -outform PEM -topk8 -nocrypt -in ca-key_.pem -out ca-key.pem

	openssl req -config openssl-root.conf -new -key ca-key.pem -out ca-cert-req.csr

	openssl x509 -req -sha256 -extfile openssl-root.conf -extensions usr_cert  -in ca-cert-req.csr -out ca-cert.pem -signkey ca-key.pem  -CAcreateserial -days 3650


	rm -rf ../crypto-config/ordererOrganizations/example.com/ca/ca.example.com-cert.pem
	rm -rf ../crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/cacerts/ca.example.com-cert.pem
	rm -rf ../crypto-config/ordererOrganizations/example.com/msp/cacerts/ca.example.com-cert.pem
	rm -rf ../crypto-config/ordererOrganizations/example.com/users/Admin@example.com/msp/cacerts/ca.example.com-cert.pem
	cp ca-cert.pem ../crypto-config/ordererOrganizations/example.com/ca/ca.example.com-cert.pem
	cp ca-cert.pem ../crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/cacerts/ca.example.com-cert.pem
	cp ca-cert.pem ../crypto-config/ordererOrganizations/example.com/msp/cacerts/ca.example.com-cert.pem
	cp ca-cert.pem ../crypto-config/ordererOrganizations/example.com/users/Admin@example.com/msp/cacerts/ca.example.com-cert.pem


		cp -rf openssl.temp openssl.conf
		sed -i "" "s/CCCCNNNN/admin@.example.com/g" openssl.conf
		sed -i "" "s/OOOOUUUU//g" openssl.conf
		rm -rf admin*
		openssl genrsa -out admin_sk 2048

		openssl pkcs8 -inform PEM -outform PEM -topk8 -nocrypt -in admin_sk -out admin-cert_sk

		openssl req -config openssl.conf -new -key admin-cert_sk -keyform pem -out admin-ca.csr

		openssl x509 -req -sha256 -extfile openssl.conf -extensions usr_cert -in admin-ca.csr -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -days 3650 -out admin-aa.pem


		cp -rf openssl.temp openssl.conf
		sed -i "" "s/CCCCNNNN/orderer.example.com/g" openssl.conf
		sed -i "" "s/OOOOUUUU//g" openssl.conf
		### peer0
		rm -rf peer*
		openssl genrsa -out peer0_sk 2048

		openssl pkcs8 -inform PEM -outform PEM -topk8 -nocrypt -in peer0_sk -out peer0-cert_sk

		openssl req -config openssl.conf -new -key peer0-cert_sk -keyform pem -out peer0-ca.csr

		openssl x509 -req -sha256 -extfile openssl.conf -extensions usr_cert -in peer0-ca.csr -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -days 3650 -out peer0-aa.pem

		rm -rf ../crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/admincerts/Admin@example.com-cert.pem
		rm -rf ../crypto-config/ordererOrganizations/example.com/msp/admincerts/Admin@example.com-cert.pem
		rm -rf ../crypto-config/ordererOrganizations/example.com/users/Admin@example.com/msp/admincerts/Admin@example.com-cert.pem
		rm -rf ../crypto-config/ordererOrganizations/example.com/users/Admin@example.com/msp/signcerts/Admin@example.com-cert.pem

		cp admin-aa.pem ../crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/admincerts/Admin@example.com-cert.pem
		cp admin-aa.pem ../crypto-config/ordererOrganizations/example.com/msp/admincerts/Admin@example.com-cert.pem
		cp admin-aa.pem ../crypto-config/ordererOrganizations/example.com/users/Admin@example.com/msp/admincerts/Admin@example.com-cert.pem
		cp admin-aa.pem ../crypto-config/ordererOrganizations/example.com/users/Admin@example.com/msp/signcerts/Admin@example.com-cert.pem

		rm -rf ../crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/signcerts/orderer.example.com-cert.pem
		cp peer0-aa.pem ../crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/signcerts/orderer.example.com-cert.pem

		cp -rf ca-key.pem ../crypto-config/ordererOrganizations/example.com/ca/ca-key_sk
		cp -rf peer0-cert_sk ../crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/keystore/
		cp -rf admin-cert_sk ../crypto-config/ordererOrganizations/example.com/users/Admin@example.com/msp/keystore/

done


for (( i = 1; i < 2; i++ )); do

		cp -rf openssl-root.temp openssl-root.conf
		sed -i "" "s/CCCCNNNN/tlsca.example.com/g" openssl-root.conf
		sed -i "" "s/OOOO/example.com/g" openssl-root.conf
	rm -rf ca*

	openssl genrsa -out ca-key_.pem 2048

	openssl pkcs8 -inform PEM -outform PEM -topk8 -nocrypt -in ca-key_.pem -out ca-key.pem

	openssl req -config openssl-root.conf -new -key ca-key.pem -out ca-cert-req.csr

	openssl x509 -req -sha256 -extfile openssl-root.conf -extensions usr_cert  -in ca-cert-req.csr -out ca-cert.pem -signkey ca-key.pem  -CAcreateserial -days 3650


rm -rf ../crypto-config/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem
rm -rf ../crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
rm -rf ../crypto-config/ordererOrganizations/example.com/msp/tlscacerts/tlsca.example.com-cert.pem
rm -rf ../crypto-config/ordererOrganizations/example.com/users/Admin@example.com/msp/tlscacerts/tlsca.example.com-cert.pem

cp ca-cert.pem ../crypto-config/ordererOrganizations/example.com/tlsca/tlsca.example.com-cert.pem
cp ca-cert.pem ../crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
cp ca-cert.pem ../crypto-config/ordererOrganizations/example.com/msp/tlscacerts/tlsca.example.com-cert.pem
cp ca-cert.pem ../crypto-config/ordererOrganizations/example.com/users/Admin@example.com/msp/tlscacerts/tlsca.example.com-cert.pem

rm -rf ../crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/tls/ca.crt
rm -rf ../crypto-config/ordererOrganizations/example.com/users/Admin@example.com/tls/ca.crt


cp ca-cert.pem ../crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/tls/ca.crt
cp ca-cert.pem ../crypto-config/ordererOrganizations/example.com/users/Admin@example.com/tls/ca.crt

		cp -rf tls.temp tls.conf
		sed -i "" "s/TTTTEEEEMMMMPPPP//g" tls.conf
		sed -i "" "s/CCCCNNNN/Admin@example.com/g" tls.conf
		rm -rf admin*
		openssl genrsa -out admin_sk 2048

		openssl pkcs8 -inform PEM -outform PEM -topk8 -nocrypt -in admin_sk -out admin-cert_sk

		openssl req -config tls.conf -new -key admin-cert_sk -keyform pem -out admin-ca.csr

		openssl x509 -req -sha256 -extfile tls.conf -extensions usr_cert -in admin-ca.csr -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -days 3650 -out admin-aa.pem

		### peer0

		cp -rf tls.temp tls.conf
		sed -i "" "s/TTTTEEEEMMMMPPPP/subjectAltName=DNS:orderer.example.com, DNS:orderer/g" tls.conf
		sed -i "" "s/CCCCNNNN/orderer.example.com/g" tls.conf
		rm -rf peer*
		openssl genrsa -out peer0_sk 2048

		openssl pkcs8 -inform PEM -outform PEM -topk8 -nocrypt -in peer0_sk -out peer0-cert_sk

		openssl req -config tls.conf -new -key peer0-cert_sk -keyform pem -out peer0-ca.csr

		openssl x509 -req -sha256 -extfile tls.conf -extensions usr_cert -in peer0-ca.csr -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -days 3650 -out peer0-aa.pem

		rm -rf ../crypto-config/ordererOrganizations/example.com/users/Admin@example.com/tls/client.key
		rm -rf ../crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/tls/server.key
		rm -rf ../crypto-config/ordererOrganizations/example.com/users/Admin@example.com/tls/client.crt
		rm -rf ../crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/tls/server.crt


		cp admin-cert_sk ../crypto-config/ordererOrganizations/example.com/users/Admin@example.com/tls/client.key
		cp peer0-cert_sk ../crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/tls/server.key

		cp admin-aa.pem ../crypto-config/ordererOrganizations/example.com/users/Admin@example.com/tls/client.crt
		cp peer0-aa.pem ../crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/tls/server.crt

		cp -rf  ca-key.pem ../crypto-config/ordererOrganizations/example.com/tlsca/ca-key_sk

done
