json.array!(@crawler_twitters) do |crawler_twitter|
  json.extract! crawler_twitter, :id, :content, :user, :tags, :publish
  json.url crawler_twitter_url(crawler_twitter, format: :json)
end
