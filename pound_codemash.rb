#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'tzinfo'

require File.expand_path(File.dirname(__FILE__) + '/lib/tweet')

DataMapper.setup(:default, "sqlite3://" + File.expand_path(File.dirname(__FILE__) + '/db/pound_codemash.sqlite3'))

TZ = TZInfo::Timezone.get('US/Eastern')

get '' do
  @tweets = Tweet.all(:order => [:created_at.desc], :limit => 15)
  erb :index
end
