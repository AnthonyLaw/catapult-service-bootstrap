# Catapult Testnet Node setup
This is a modified verison of [Catapult Service Bootstrap](https://github.com/tech-bureau/catapult-service-bootstrap).

For users to contribure catapult node on Testnet.

# Prerequisites
- Docker and Docker-compose.
    [Download Docker](https://docs.docker.com/install/)
    [Download Docker Compose](https://docs.docker.com/compose/install/)

- 4 accounts for
    API node
    Peer node
    Harvesting (optional)
    Rest-gateway

    To create an address, use [NEM2-Cli](https://www.npmjs.com/package/nem2-cli) with this [endpoint](http://40.90.163.184:3000).

# Cloning from Github
```
git clone -b testnet-node https://github.com/AnthonyLaw/catapult-service-bootstrap.git
```

# Configuration
At catapult-service-bootstrap directory, do the following configurations:

## api-node-0
> ./userconfig/resources/config-node.properties
```
[localnode]
host = api-node-0  
friendlyName = api-node-0
version = 0
roles = Api
```
**host** Do not need to make changes if run locally. If it is running in a server, change it to the host IP address. 

> ./userconfig/resources/config-user.properties
```
[account]

bootKey = BE449D7F357267F39E3B46BCE797742F5B9A944332264403385E43FF536F2C12
```
**bootKey** From the accounts created, assign one private key here to boot the node. Do not use this account to hold any XEM.

> ./userconfig/resources/peers-p2p.json
```
"publicKey": "AB52414B67CE69C48808CD1902EFFAB4532081261C68F5FCC08855B604EA1542",
"endpoint": {
"host": "peer-node-1",
"port": 7900
```
**publicKey** Public key of peer-node-1. 

>./userconfig/ resources/peers-api.json
```
"publicKey": "AB52414B67CE69C48808CD1902EFFAB4532081261C68F5FCC08855B604EA1542",
"endpoint": {
"host": "api-node-0",
"port": 7900
},
```
**publicKey** Public key of api-node-1.

## peer-node-1
> ./userconfig/resources/config-harvesting.properties
**harvestKey** (This is optional.) From the accounts created, assign one private key here to boot the node. Do not use this account to hold any XEM.

> ./userconfig/resources/config-user.properties
```
[account]

bootKey = 6201BAC38A182878F7DD710269ABB0F6386E80126F9992D27B02133E894CA1D4
```
**bootKey** From the accounts created, assign one private key here to boot the node. Do not use this account to hold any XEM.

> ./userconfig/resources/peers-p2p.json
```
"publicKey": "AB52414B67CE69C48808CD1902EFFAB4532081261C68F5FCC08855B604EA1542",
"endpoint": {
"host": "peer-node-1",
"port": 7900
```
**publicKey** Public key of peer-node-1. 

>./userconfig/ resources/peers-api.json
```
"publicKey": "AB52414B67CE69C48808CD1902EFFAB4532081261C68F5FCC08855B604EA1542",
"endpoint": {
"host": "api-node-0",
"port": 7900
},
```
**publicKey** Public key of api-node-1.

## rest-gateway-0
>./userconfig/rest.json
```
  "port": 3000,
  "crossDomainHttpMethods": ["GET", "POST", "PUT", "OPTIONS"],
  "clientPrivateKey": "36FF84E222460A8F4E0CC85FBDFC0207ACDFF4C07A33A1CE7EA98CF3CDFFC5E0",
  "extensions": ["aggregate", "lock", "multisig", "namespace", "transfer"],
```
**clientPrivateKey** From the accounts created, assign one private key here to boot the node. Do not use this account to hold any XEM.

```
"apiNode": {
    "host": "api-node-0",
    "port": 7900,
    "publicKey": "AB52414B67CE69C48808CD1902EFFAB4532081261C68F5FCC08855B604EA1542"
  },
```
**host** The api node name or api host IP address. 
**publicKey** Public key of the api-node-0.

```
    "mq": {
      "host": "api-node-0",
      "port": 7902,
      "monitorInterval": 500,
      "connectTimeout": 10000,
      "monitorLoggingThrottle": 60000
    },
```
**host** The api node name or api host IP address. 

# Database Dump
Download the [database dump.] (https://drive.google.com/open?id=1VLcn-5PE1JoNDdKcMLRdWTt1lCtIHkJA)
Unzip the file.
Replace “mongo” and “api-node-0” in ./data with the unzipped folders.

# Launch the Node
Launch docker and run the node.

`cd catapult-service-bootstrap (or other name if you rename the folder)`
`docker-compose up`

