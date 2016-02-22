module HomeHelper

  def average_times_home

    times_home = Array.new

    average_times = {
        "times" => {
            "01:00:00" => ["01:00:00", "01:59:59"],
            "02:00:00" => ["02:00:00", "02:59:59"],
            "03:00:00" => ["03:00:00", "03:59:59"],
            "04:00:00" => ["04:00:00", "04:59:59"],
            "05:00:00" => ["05:00:00", "05:59:59"],
            "06:00:00" => ["06:00:00", "06:59:59"],
            "07:00:00" => ["07:00:00", "07:59:59"],
            "08:00:00" => ["08:00:00", "08:59:59"],
            "09:00:00" => ["09:00:00", "09:59:59"],
            "10:00:00" => ["10:00:00", "10:59:59"],
            "11:00:00" => ["11:00:00", "11:59:59"],
            "12:00:00" => ["12:00:00", "12:59:59"],
            "13:00:00" => ["13:00:00", "13:59:59"],
            "14:00:00" => ["14:00:00", "14:59:59"],
            "15:00:00" => ["15:00:00", "15:59:59"],
            "16:00:00" => ["16:00:00", "16:59:59"],
            "17:00:00" => ["17:00:00", "17:59:59"],
            "18:00:00" => ["18:00:00", "18:59:59"],
            "19:00:00" => ["19:00:00", "19:59:59"],
            "20:00:00" => ["20:00:00", "20:59:59"],
            "21:00:00" => ["21:00:00", "21:59:59"],
            "22:00:00" => ["22:00:00", "22:59:59"],
            "23:00:00" => ["23:00:00", "23:59:59"],
            "00:00:00" => ["00:00:00", "00:59:59"],
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
          times_home << "#{time_init} -> #{media.round(2)}"
        end

      end

    end

    return times_home

  end

end
