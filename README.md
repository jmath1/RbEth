I noticed that there was no endpoint on Etherscan's API to get the richest addresses.
However, there is a website to go to get the richest addresses as well as data that corresponds to the addresses.

This code is a light webserver that scrapes the data and returning it in JSON format.

First: run `bundle install` to install the required gems

Sample use:

    ruby api.rb

http://localhost:4567/4 produces the an array that would look like the following:
    
    [
        {
            "rank":"1",
            "address":"0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2",
            "alias":"Wrapped Ether",
            "percentage":"2.27698159",
            "balance":"2408622.98385984"
        },
        {
            "rank":"2",
            "address":"0x4e9ce36e442e55ecd9025b9a6e0d88485d628a67",
            "alias":"Binance 6",
            "percentage":"2.22780379","balance":"2356602.02099107"},
        {
            "rank":"3",
            "address":"0x742d35cc6634c0532925a3b844bc454e4438f44e",
            "alias":"Bitfinex 5",
            "percentage":"2.06984044",
            "balance":"2189506.17536702"
        },
        {
            "rank":"4",
            "address":"0x53d284357ec70ce289d6d64134dfac8e511c8a3d",
            "alias":"Kraken 6",
            "percentage":"1.30339942",
            "balance":"1378754.14306818"
        }
    ]
