#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'json'

def fetch
  url = 'https://www18.atwiki.jp/pazdra/pages/1706.html'
  puts "Fetching from #{url} ..."
  open(url).read
end

def parse(content)
  m = {}
  content.split('<div class=').each do |div|
    next unless /^"db_all"/ =~ div
    div.split('<td ').each do |td|
      /^[^>]+>\s*No.\s*(\d+)\s*<a href="([^"]+)/ =~ td
      next unless $2
      num = $1.to_i
      link = $2
      pnum = link.split('/').last.split('.').first.to_i
      m[num] = pnum if pnum > 0
    end
  end
  m
end

def update
  json = parse(fetch).to_json
  open('data.json', 'w') do |f|
    f.write(json)
  end
end

update
