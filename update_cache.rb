#!/usr/bin/env ruby
require 'rubygems'
require 'httparty'
require 'dm-core'
 
require File.join(File.dirname(__FILE__), 'lib/tweet.rb')
 
DATABASE_FILE = File.expand_path(File.dirname(__FILE__) + '/db/pound_codemash.sqlite3')
DataMapper.setup(:default, "sqlite3://#{DATABASE_FILE}")
# DataMapper.auto_migrate!

tweets = HTTParty.get("http://search.twitter.com/search.json?q=%23codemash")
tweets["results"].each do |tweet|
  next if Tweet.first(:id => tweet["id"])

  Tweet.create(:id => tweet["id"],
               :text => tweet["text"],
               :from_user_id => tweet["from_user_id"],
               :from_user => tweet["from_user"],
               :created_at => Time.parse(tweet["created_at"]))
end
