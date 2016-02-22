module HomeHelper

  def average_times_home

    times_home = Array.new

    average_times = {
        "times" => {
            "11:00:00" => ["11:00:00", "11:59:59"],
            "12:00:00" => ["12:00:00", "12:59:59"],
            "13:00:00" => ["13:00:00", "13:59:59"],
            "14:00:00" => ["14:00:00", "14:59:59"],
            "15:00:00" => ["15:00:00", "15:59:59"],
            "16:00:00" => ["16:00:00", "16:59:59"],
            "17:00:00" => ["17:00:00", "17:59:59"],
            "18:00:00" => ["18:00:00", "18:59:59"],
            "19:00:00" => ["19:00:00", "19:59:59"],
        }
    }

    average_times.each do |key, value|

      value.each do |key2, times|

        time_init = times[0].to_s
        time_end = times[1].to_s

        @crawler_twitter = @crawler_twitters.average_time(time_init.to_s, time_end.to_s)

        total_tweets = @crawler_twitter.getvalue(0, 0)
        total_tweets_time = @crawler_twitter.getvalue(0, 1)

        if !total_tweets_time.blank?
          media = (total_tweets.to_f / total_tweets_time.to_f)
        else
          media = nil
        end

        if media.blank?
          times_home << "#{time_init} Nao foi encontrado Tweets nesse horario no banco de dados"
        else
          times_home << "#{time_init} -> #{media}"
        end

      end

    end

    return times_home

  end

end
