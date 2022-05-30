#!/bin/sh

./tls.sh generate --generationType CA  --CADir ./cfg/sensorapi/tls/sec --certDir ./cfg/sensorapi/tls/sec --caKeyPem rootCAkey.pem --caCertPem rootCACert.pem --caDuration 3650

./tls.sh generate --generationType cert --CADir ./cfg/sensorapi/tls/sec --certDir ./cfg/sensorapi/tls/sec --caKeyPem rootCAkey.pem --caCertPem rootCACert.pem --certDuration 365 --CN localhost --C BG --L Sofia --O TT --OU system --SAN DNS:localhost,DNS:sensorapi --certRequestFile sensorapiCert.csr --certPem sensorapiCert.pem --certKeyPem sensorapiKey.pem

./tls.sh generate --generationType cert --CADir ./cfg/sensorapi/tls/sec --certDir ./cfg/mailsender/tls/sec --caKeyPem rootCAkey.pem --caCertPem rootCACert.pem --certDuration 365 --CN localhost --C BG --L Sofia --O TT --OU system --SAN DNS:localhost,DNS:mailSender --certRequestFile mailSenderCert.csr --certPem mailSenderCert.pem --certKeyPem mailSenderKey.pem

docker-compose up