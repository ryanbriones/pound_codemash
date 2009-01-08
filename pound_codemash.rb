#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'tzinfo'

require File.expand_path(File.dirname(__FILE__) + '/lib/tweet')

DataMapper.setup(:default, "sqlite3://" + File.expand_path(File.dirname(__FILE__) + '/db/pound_codemash.sqlite3'))

TZ = TZInfo::Timezone.get('US/Eastern')

get '' do
  @queued_tweets = Tweet.all(:order => [:created_at.desc], :limit => 10)
  @tweets = [@queued_tweets.pop]
  erb :index
end

get '/updated' do
  @tweets = Tweet.all(:id.gt => params[:since], :order => [:created_at.desc])
  erb :tweets
end
