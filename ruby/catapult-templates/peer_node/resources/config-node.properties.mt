[node]

port = {{port}}
apiPort = {{api_port}}
maxIncomingConnectionsPerIdentity = 3

enableAddressReuse = false
enableSingleThreadPool = false
enableCacheDatabaseStorage = {{enable_cache_database_storage}}
enableAutoSyncCleanup = {{enable_auto_sync_cleanup}}

enableTransactionSpamThrottling = true
transactionSpamThrottlingMaxBoostFee = 10'000'000

maxBlocksPerSyncAttempt = 400
maxChainBytesPerSyncAttempt = 100MB

shortLivedCacheTransactionDuration = 10m
shortLivedCacheBlockDuration = 100m
shortLivedCachePruneInterval = 90s
shortLivedCacheMaxSize = 10'000'000

minFeeMultiplier = 0
transactionSelectionStrategy = oldest
unconfirmedTransactionsCacheMaxResponseSize = 20MB
unconfirmedTransactionsCacheMaxSize = 1'000'000

connectTimeout = 10s
syncTimeout = 60s

socketWorkingBufferSize = 512KB
socketWorkingBufferSensitivity = 100
maxPacketDataSize = 150MB

blockDisruptorSize = 4096
blockElementTraceInterval = 1
transactionDisruptorSize = 16384
transactionElementTraceInterval = 10

enableDispatcherAbortWhenFull = true
enableDispatcherInputAuditing = true

outgoingSecurityMode = None
incomingSecurityModes = None

maxCacheDatabaseWriteBatchSize = 5MB
maxTrackedNodes = 5'000

# all hosts are trusted when list is empty
trustedHosts =
localNetworks = 127.0.0.1

[localnode]

host = {{host}}
friendlyName = {{friendly_name}}
version = 0
roles = Peer

[outgoing_connections]

maxConnections = 10
maxConnectionAge = 200
maxConnectionBanAge = 20
numConsecutiveFailuresBeforeBanning = 3

[incoming_connections]

maxConnections = 512
maxConnectionAge = 200
maxConnectionBanAge = 20
numConsecutiveFailuresBeforeBanning = 3
backlogSize = 512

[banning]

defaultBanDuration = 12h
maxBanDuration = 72h
keepAliveDuration = 48h
maxBannedNodes = 5'000

numReadRateMonitoringBuckets = 4
readRateMonitoringBucketDuration = 15s
maxReadRateMonitoringTotalSize = 100MB
