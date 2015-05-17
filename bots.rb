#!/usr/bin/env ruby

require 'twitter_ebooks'
require_relative 'os'

class UberFactsEbooks < Ebooks::Bot

  def configure
    self.consumer_key = ""
    self.consumer_secret = ""
  end

  def on_startup
    scheduler.every '10m' do
      model = Ebooks::Model.load("model/uberfactsmar2015.model")
      tweet(model.make_statement(140))
    end
  end
end

UberFactsEbooks.new("UberFactsEbooks") do |bot|
  bot.access_token = ""
  bot.access_token_secret = ""
end