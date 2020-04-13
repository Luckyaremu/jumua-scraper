#!/usr/bin/env ruby
require 'nokogiri'
require 'httparty'
#require 'byebug'
require 'rubocop'

require_relative '../lib/scraper.rb'

class Start
  def initialize
    display
    @searches = 0
  end

  def search
    input

    p 'Search in progess...'
    sleep 1  end

  private

  def input
    input = gets.chomp
    while input.empty?
      puts 'Please enter a keyword'
      input = gets.chomp
    end
    puts 'Thank you!'
    @keywords = input.split(' ')
  end

  def display
    puts 'Welcome to jumia.com.ng'
    puts 'This website helps you to find all smart-phone and tablets sold on jumia online shop.'
    puts 'Type your keywords and press enter to find out everything related to Tablet-smartphone sold on jumia.'
  end

  def show_results
    puts '***********'
    puts '***********'
  end
  def research
    print 'Do you need to search anything else? (y/n) '
    research = gets.chomp
    restart(research)
  end

  def restart(research)
    research == 'y' ? search : (p 'Thank you for choosing us, goodbye!')
  end
end

new_search = Start.new
new_search.search