### 先生成指定的目录
### 再生成ca,放到指定的目录下
### 根据CA,生成证书

# domain=example.com
# list={'org1', 'org2', 'orderer'}
# caList={'ca', 'tlsca'}
# for org in list; do
# 	for ca in caList; do
# 		cp -rf openssl.temp openssl.conf
# 		sed -i "" "s/CCCCNNNN/$ca.$org.$domain/g" openssl.conf
# 		sed -i "" "s/OOOO/org$i.example.com/g" openssl.conf
# 		sed -i "" "s/OOOOUUUU/client/g" openssl.conf
# 		sed -i "" "s/BBBBCCCC/basicConstraints=critical,CA:false/g" openssl.conf
# 		sed -i "" "s/KKKKUUUU/keyUsage=critical, Digital Signature, Key Encipherment, Certificate Sign, CRL Sign/g" openssl.conf
# 		sed -i "" "s/EEEEKKKKUUUU/extendedKeyUsage=TLS Web Client Authentication, TLS Web Server Authentication/g" openssl.conf
# 		sed -i "" "s/AAAAKKKKIIII/authorityKeyIdentifier=keyid:issuer/g" openssl.conf
# 		sed -i "" "s/SSSSKKKKIIII/subjectKeyIdentifier=hash/g" openssl.conf
# 	done
# done

mv /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/ordererOrganizations/example.com/tlsca/ca-key_sk /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/ordererOrganizations/example.com/tlsca/2a152209106e784994383ed5caafa27b5ec52f92aa64abcfacdbb75194718969_sk
mv /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/ordererOrganizations/example.com/ca/ca-key_sk /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/ordererOrganizations/example.com/ca/7fa300debdf46a3eb6b46f16fdf657cf5af7537dbd930593fb3637ffd28cfecb_sk
mv /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/keystore/peer0-cert_sk /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/keystore/f8a8dec09880aa16085c0af690f406a42185521c3b00180001d55a5d2cf73456_sk
mv /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/ordererOrganizations/example.com/users/Admin@example.com/msp/keystore/admin-cert_sk /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/ordererOrganizations/example.com/users/Admin@example.com/msp/keystore/e7e8b86526d22fdf824a3d21659c205608747df7d3ca864778fba1ce9b94b72e_sk
mv /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/peerOrganizations/org1.example.com/tlsca/ca-key_sk /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/peerOrganizations/org1.example.com/tlsca/487288a7fdc5e222a4403ecb67fa84bcf4b2824eab99cf400b993b3137ef8bb7_sk
mv /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/peerOrganizations/org1.example.com/ca/ca-key_sk /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/peerOrganizations/org1.example.com/ca/69bc34f715b346085255a6ee8d647ce819f64de2673a66f6424f24b8cb3770cf_sk
mv /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/admin-cert_sk /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/2a3710b30bff17305f30bb100ff0e1f5dc1352e9eada35095c1ff9c838af81c9_sk
mv /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/msp/keystore/peer1-cert_sk /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/msp/keystore/09bf78c60e5915ad22abbc9c54be2a01a29369af6b871964a32dece8492a369b_sk
mv /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/msp/keystore/peer0-cert_sk /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/msp/keystore/7f3f20f19f56ba5a3b75017b1826e7a2d0bea7378459b12454d473ecf88671b0_sk
mv /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/peerOrganizations/org2.example.com/tlsca/ca-key_sk /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/peerOrganizations/org2.example.com/tlsca/7b3b5f14f1022e0371352089bbe54cbc95fd637a5f9821fd7996ff5a08ec11c6_sk
mv /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/peerOrganizations/org2.example.com/ca/ca-key_sk /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/peerOrganizations/org2.example.com/ca/bff9fe3eb7071090b08f258fb8f8e9453f2f44e55f089bf5aebd66583050d943_sk
mv /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/keystore/admin-cert_sk /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/keystore/bf1f24e4ef87ea765a02303e6b40a38c918241cc2db017d95ddd7a921897b69d_sk
mv /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/msp/keystore/peer0-cert_sk /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/msp/keystore/95d58be7fe8d73ad17acc1e70eeec8655d0a5aecaefd1d5dc748cf103bc0d443_sk
mv /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/peerOrganizations/org2.example.com/peers/peer1.org2.example.com/msp/keystore/peer1-cert_sk /Users/zhaotao/Documents/work_dir/test/fabric-samples/first-network/crypto-config/peerOrganizations/org2.example.com/peers/peer1.org2.example.com/msp/keystore/94f4100ea42d07d632701055779d2db1adf7a87459fe17e140b58e9238ccb46f_sk