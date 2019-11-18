rm -rf ../crypto-config/peerOrganizations/org1.example.com/ca/ca.org1.example.com-cert.pem
rm -rf ../crypto-config/peerOrganizations/org1.example.com/msp/cacerts/ca.org1.example.com-cert.pem
rm -rf ../crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/cacerts/ca.org1.example.com-cert.pem
rm -rf ../crypto-config/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/msp/cacerts/ca.org1.example.com-cert.pem
rm -rf ../crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/msp/cacerts/ca.org1.example.com-cert.pem

cp ca-cert.pem ../crypto-config/peerOrganizations/org1.example.com/ca/ca.org1.example.com-cert.pem
cp ca-cert.pem ../crypto-config/peerOrganizations/org1.example.com/msp/cacerts/ca.org1.example.com-cert.pem
cp ca-cert.pem ../crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/cacerts/ca.org1.example.com-cert.pem
cp ca-cert.pem ../crypto-config/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/msp/cacerts/ca.org1.example.com-cert.pem
cp ca-cert.pem ../crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/msp/cacerts/ca.org1.example.com-cert.pem


rm -rf ../crypto-config/peerOrganizations/org1.example.com/msp/admincerts/Admin@org1.example.com-cert.pem
rm -rf ../crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/admincerts/Admin@org1.example.com-cert.pem
rm -rf ../crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts/Admin@org1.example.com-cert.pem
rm -rf ../crypto-config/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/msp/admincerts/Admin@org1.example.com-cert.pem
rm -rf ../crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/msp/admincerts/Admin@org1.example.com-cert.pem

cp admin-aa.pem ../crypto-config/peerOrganizations/org1.example.com/msp/admincerts/Admin@org1.example.com-cert.pem
cp admin-aa.pem ../crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/admincerts/Admin@org1.example.com-cert.pem
cp admin-aa.pem ../crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts/Admin@org1.example.com-cert.pem
cp admin-aa.pem ../crypto-config/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/msp/admincerts/Admin@org1.example.com-cert.pem
cp admin-aa.pem ../crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/msp/admincerts/Admin@org1.example.com-cert.pem

rm -rf ../crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/msp/signcerts/peer0.org1.example.com-cert.pem
rm -rf ../crypto-config/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/msp/signcerts/peer1.org1.example.com-cert.pem
cp peer0-aa.pem ../crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/msp/signcerts/peer0.org1.example.com-cert.pem
cp peer1-aa.pem ../crypto-config/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/msp/signcerts/peer1.org1.example.com-cert.pem

rm -rf ../crypto-config/peerOrganizations/org1.example.com//ca/1757778937907e89e9dc79aae2019e8fe5518904ca581b49a6875d6c77048723_sk
rm -rf ../crypto-config/peerOrganizations/org1.example.com//users/Admin@org1.example.com/msp/keystore/abc0424c7d9f30eaceacf3b812d03041aa8543d6c3f737bec4d5df7f62366295_sk
rm -rf ../crypto-config/peerOrganizations/org1.example.com//peers/peer1.org1.example.com/msp/keystore/373d884739c04589054ceb9563dfe03be1b0920c11edaa9c27d7bdf4067802c7_sk
rm -rf ../crypto-config/peerOrganizations/org1.example.com//peers/peer0.org1.example.com/msp/keystore/17fb5ef8d02200b28d174e934834df874f27e4324b9c401116f3a72fa8f8bf7b_sk
cp ca-key.pem ../crypto-config/peerOrganizations/org1.example.com//ca/1757778937907e89e9dc79aae2019e8fe5518904ca581b49a6875d6c77048723_sk
cp admin-cert_sk ../crypto-config/peerOrganizations/org1.example.com//users/Admin@org1.example.com/msp/keystore/abc0424c7d9f30eaceacf3b812d03041aa8543d6c3f737bec4d5df7f62366295_sk
cp peer1-cert_sk ../crypto-config/peerOrganizations/org1.example.com//peers/peer1.org1.example.com/msp/keystore/373d884739c04589054ceb9563dfe03be1b0920c11edaa9c27d7bdf4067802c7_sk
cp peer0-cert_sk ../crypto-config/peerOrganizations/org1.example.com//peers/peer0.org1.example.com/msp/keystore/17fb5ef8d02200b28d174e934834df874f27e4324b9c401116f3a72fa8f8bf7b_sk
