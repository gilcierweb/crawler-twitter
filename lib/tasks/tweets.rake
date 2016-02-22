namespace :tweets do

  desc "Average time for tweets options{:time_init, :time_end} ex: rake tweets:average_time['14:00:00','14:59:59']"

  task :average_time, [:time_init, :time_end] => :environment do |task, args|

    puts time_init = args.time_init
    puts time_end = args.time_end

    if time_init.blank? || time_end.blank?
      time_init, time_end = nil
      @crawler_twitters = CrawlerTwitter.average_time()
    else
      @crawler_twitters = CrawlerTwitter.average_time(time_init.to_s, time_end.to_s)
    end

    # nao conseguir identificar esse bug da gem PG, so conseguir trazer os resultados assim
    total_tweets = @crawler_twitters.getvalue(0, 0)
    total_tweets_time = @crawler_twitters.getvalue(0, 1)
    media = (total_tweets.to_f / total_tweets_time.to_f)

    # Média de tweets por horário | 12:00 -> 125, 13:00 -> 200, 15:00 -> 475, ... |
    puts "Média de tweets por horário | #{time_init} - #{time_end} -> #{media.round(2)}"

  end

  desc "User with the most tweets"

  task :user_most => :environment do

    @crawler_twitters = CrawlerTwitter.user_most

    # @crawler_twitters.each do |crawler_twitter|
    puts "Usuário com maior número de tweets | @#{@crawler_twitters[0].user} com #{@crawler_twitters[0].countuser} tweets"
    # end
  end

end
