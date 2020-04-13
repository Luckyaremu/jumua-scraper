#!/usr/bin/env ruby

require_relative '../bin/test.rb'

def scraper
    url = "https://www.jumia.com.ng/mobile-phones/tecno/"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    smart_phone = []
    shopCart = parsed_page.css('a.link') #data for 40 phone
    page = 1
    per_page = shopCart.count #40
    total = parsed_page.css('span.total-products').text.split(' ')[0].split('').drop(1).join('').to_i #1978058
    # total = ('1978058').to_i
    last_page = (total / per_page) #500000
begin
    while page <= last_page
        pargination_url = "https://www.jumia.com.ng/mobile-phones/tecno/?page=#{page}"
        puts pargination_url
        puts "page: #{page}"
        puts ""
        pargination_unparsed_page = HTTParty.get(pargination_url)
        pargination_parsed_page = Nokogiri::HTML(pargination_unparsed_page)
        pargination_shopCart = pargination_parsed_page.css('a.link')
    shopCart.each do |shopCart|
        shop = {
            brand: shopCart.css('span.brand').text,
            specifications: shopCart.css('span.name').text,
            price_range: shopCart.css('span.price').text,
    }
     CSV.open('smart_phone.csv', 'w') do |csv|
            smart_phone.each do |smart_phone|
               csv << [smart_phone]
            end
        end
    smart_phone << shop
    puts "Added phone brand #{shop[:brand]}"
    puts "all techno phones available on Jumia Nigeria is been scrapped"
    puts ""
    end
    page += 1
end
def print_results
    puts 'The search has finished'
    puts "All mobile phones on jumia is available"
    puts 'Here you can find the products, prices and specifications: '
    end
    puts 'The prices are shown in Nigeria Naira'
    puts "Thank you for choosing us"
    puts "Goodbye"
  end
end
scraper