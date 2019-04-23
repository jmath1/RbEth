require 'HTTParty'
require 'Nokogiri'
require 'json'

class EthScraper
  
  def scrape_rank(d)
    return d.text
  end

  def scrape_address(d)
    return d.css("a").text
  end

  def scrape_alias(d)
    if d.text.empty?
      return ""
    else
      return d.text
    end
  end

  def scrape_balance(d)
    #use regex to get balance
    balance = ""
    d.text.chars do |c|
      if /[0-9]/.match(c) || c == "," || c == "."
        balance += c
      end
    end
    balance_without_commas = ""
    balance.chars do |c|
      if c != ","
        balance_without_commas += c
      end
    end
    return balance_without_commas
  end

  def scrape_percentage(d)
    percentage = ""
    d.text.chars do |c|
      if /[0-9]/.match(c) || c == "."
        percentage += c
      end
    end
    return percentage
  end

  def extract_data_from_doc(doc)
    ranks = []
    addresses = []
    aliases = []
    percentages = []
    balances = []
    parsed_page = Nokogiri::HTML(doc)
    #get the element with the class .table-hover and the rows in the element
    l = parsed_page.at('.table-hover')
    rows = l.css('tr')
    targetrows = []

    #convert from xml to string to manipulate
    rows.each do |r|
      targetrow = []
      r.children.each do |c|
        targetrow.push(c.to_html)
      end
      targetrows.push(targetrow)
    end
    #slice off the top row
    targetrows.slice!(0)
    #convert to arrays of nokogiri xml
    targetrows.map! do |row|
      row.map! do |d|
        Nokogiri::XML(d)
      end
    end

    targetrows.each do |tr|
      ranks.push(scrape_rank(tr[0]))
      addresses.push(scrape_address(tr[1]))
      aliases.push(scrape_alias(tr[2]))
      balances.push(scrape_balance(tr[3]))
      percentages.push(scrape_percentage(tr[4]))
    end

    return ranks, addresses, aliases, percentages, balances
  end

  def richest_addresses(num)

    addresses = []
    ranks = []
    aliases = []
    percentages = []
    balances = []
    page_number = 1

    while addresses.length <= num.to_i
      doc = HTTParty.get("https://etherscan.io/accounts/#{page_number}?ps=100")

      #join newly generated arrays with previously generated ones
      new_ranks, new_addresses, new_aliases, new_percentages, new_balances = extract_data_from_doc(doc)
      ranks += new_ranks
      addresses += new_addresses
      aliases += new_aliases
      percentages += new_percentages
      balances += new_balances

      page_number += 1

    end

    #wrangle into an array of transactions
    result_data  = []
    i = 0
    while i < num.to_i
      result_data.push({
        :rank => ranks[i],
        :address =>addresses[i],
        :alias =>aliases[i],
        :percentage => percentages[i],
        :balance => balances[i]
      })
      i+=1
    end
    return result_data
  end

end
