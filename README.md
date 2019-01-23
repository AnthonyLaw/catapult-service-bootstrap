# Catapult Testnet Node setup

This is express verison of [Catapult Service Bootstrap](https://github.com/tech-bureau/catapult-service-bootstrap).

mainly for user to contribure catapult node on Testnet.

# Prerequisites
- docker and docker-compose in server

Endpoint for [create catapult address](http://40.90.163.184:3000) in [NEM2-Cli](https://www.npmjs.com/package/nem2-cli).

we need 4 address for
- API node
- Peer node
- harvesting(optional)
- rest-gateway

# configuration

Only API node host need change to host ip address, if you are running in server.
Peer node will run at the background to sync block.

## api-node-0
> config-node.properties
```
[localnode]
host = api-node-0  // change to host ip, if you run in server.
friendlyName = api-node-0
version = 0
roles = Api
```

> config-user.properties
`bootKey = // assign a API node private key`

## peer-node-1
> config-harvesting.properties
`harvestKey =  // harvest private Key (optional)`

> config-user.properties
`bootKey = // assign a API node private key`


## api-node-0 && peer-node-1
- peers-api.json and peers-p2p.json, `publicKey` from API node account and Peer node account

## rest-gateway-0
>rest.json
`clientPrivateKey = // rest account privateKey`
`apiNode > host // api host ip || api node name`
`apiNode > publicKey // api account publicKey`
`websocket.mq.host =  // api host ip || api node name`