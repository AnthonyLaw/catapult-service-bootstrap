# Catapult Testnet Node setup
This is a modified verison of Tech Bureau's [Catapult Service Bootstrap](https://github.com/tech-bureau/catapult-service-bootstrap) for users to contribute Catapult node on testnet.

# Prerequisites
- Docker and Docker-compose.  
    [Download Docker](https://docs.docker.com/install/)  
    [Download Docker Compose](https://docs.docker.com/compose/install/)

- 4 accounts for:  
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
Download the [database dump.](https://drive.google.com/open?id=1VLcn-5PE1JoNDdKcMLRdWTt1lCtIHkJA)  
Unzip the file.  
Replace “mongo” and “api-node-0” in `./data` with the unzipped folders.

# Launch the Node
Launch docker and run the node.

`cd catapult-service-bootstrap (or other name if you rename the folder)`  
`docker-compose up`

# Update Node List
Update your node IP here:  
## Peer Nodes
|Name        |Host IP           |Public Key  |
| ------------- |:-------------:| -----:|
|peer-node-anthony      |40.90.163.78 |5366B2BC3B26FB4387868DD4774199B72F87F10E9CD3FABAB3A31CAA90A735B7 |
|peer-node-bison      |40.90.163.32      |30A221AF91FE5073A2FF84B6A6DC7B42C3F1785BEC6015ED2E10C4C4B0F8B796 |
|peer-node-jp-0 |52.198.174.162      |99D316FDCFF4BA43A46AE227440BC51AEE3D08AA570CD94BB5AEB7F0B0A1D962 |  

## API Nodes
|Name        |Host IP           |Public Key  |
| ------------- |:-------------:| -----:|
|api-node-0      |40.90.163.184 |502D18CECFA3E7A62489A2258B09303DB698DA9B86F2586D5305EC87995EEED8 |
|api-node-jp-0      |52.198.174.162:7910      |C5E7F15BA8AAAC1999C1490CDFCFBBF67536AF0159DD103B67B0D1A754ADE0DE |

