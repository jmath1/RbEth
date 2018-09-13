I noticed that there was no endpoint on Etherscan's API to get the richest addresses.
However, there is a website to go to get the richest addresses as well as data that corresponds to the addresses.

This code is a class that is used for scraping the data and returning it in JSON format.

Sample use:

    eth_scraper = EthScraper.new()
    puts eth_scraper.richest_addresses(5)

returns the following array at the present time:

    {:rank=>"1", :address=>"0x281055afc982d96fab65b3a49cac8b878184cb16", :alias=>"", :percentage=>"1.50941677", :balance=>"1,538,423.10656596"}
    {:rank=>"2", :address=>"0x6f46cf5569aefa1acc1009290c8e043747172d89", :alias=>"", :percentage=>"1.48159398", :balance=>"1,510,065.64213014"}
    {:rank=>"3", :address=>"0x90e63c3d53e0ea496845b7a03ec7548b70014a91", :alias=>"", :percentage=>"1.47938129", :balance=>"1,507,810.42865836"}
    {:rank=>"4", :address=>"0x742d35cc6634c0532925a3b844bc454e4438f44e", :alias=>"Bitfinex_5", :percentage=>"1.46769489", :balance=>"1,495,899.45978807"}
    {:rank=>"5", :address=>"0xfe9e8709d3215310075d67e3ed32a380ccf451c8", :alias=>"Binance_5", :percentage=>"1.36354398", :balance=>"1,389,747.08690362"}
