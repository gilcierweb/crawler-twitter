#!/usr/bin/env ruby
require 'nokogiri'
require 'rest-client'
require 'open-uri'

require 'tweetstream'

#Variables that contains the user credentials to access Twitter API
consumer_key = ENV['CONSUMER_KEY']
consumer_secret = ENV['CONSUMER_SECRET']
access_token = ENV['ACCESS_TOKEN']
access_token_secret = ENV['ACCESS_TOKEN_SECRET']

TweetStream.configure do |config|
  puts config.consumer_key = consumer_key
  config.consumer_secret = consumer_secret
  config.oauth_token = access_token
  config.oauth_token_secret = access_token_secret
  config.auth_method = :oauth
end

puts 'Informe a palavra a ser pesquisada no twitter, pode ser uma ou mais palavras separadas por virgula ex: dilma, lula'

params = gets.to_s.strip.downcase.chomp

class CrawlerTwitter

  def crawler_data(params = 'dilma, lula')

    begin

      @client = TweetStream::Client.new

      @client.on_reconnect do |timeout, retries|
        puts "Reconnecting in #{timeout} seconds, retry number #{retries}"
      end

      @client.on_error do |message|
        puts "Tweetstream error: #{message}"
      end

      @client.track(params) do |status|
        if status.is_a?(Twitter::Tweet)

          data = {
              content: status.text,
              user: status.user.screen_name,
              publish: status.created_at,
              # retweet_count: status.retweet_count,
              # id: status.id,
              tags: status.id,

          }

          puts data.inspect

          # grava os dados retornados em um arquivo twitter.txt
          File.open("twitter.txt", 'a+') { |file| file << "#{data}\n" }

          # enviar os dados retornados para app rails gravar no banco de dados postgresql
          RestClient.post "http://localhost:3000/crawler_twitters", data.to_json, :content_type => :json, :accept => :json

          puts 'Done recorded in the database'

        end
      end

    rescue Tweetstream::ReconnectError
      puts "Tweetstream crashed due to reconnect error, will restart shortly"
    end

  end

end

# usando o crawler twitter
@crawler_twitter = CrawlerTwitter.new

if params.to_s.empty?
  @crawler_twitter.crawler_data()
else
  @crawler_twitter.crawler_data(params)
end
