class CrawlerTwitter < ActiveRecord::Base

  paginates_per 500

  validates :content, :user, :tags, :publish, presence: true

  def self.average_time(time_init = '13:00:00', time_end = '13:59:59')

    # quantos tweets 12;00, 13:00
    query = <<-SQL
                  SELECT COUNT(*) AS total_tweets,
                  (SELECT COUNT(*) FROM crawler_twitters WHERE CAST(publish AS TIME) BETWEEN '#{time_init}' AND '#{time_end}'
                  GROUP BY user) AS total_tweets_time
                  FROM crawler_twitters
    SQL

    self.connection.execute(sanitize_sql(query))

  end

  def self.user_most(limit = 1)

    query = <<-SQL
                  SELECT twitter.user, COUNT(*) AS countuser FROM crawler_twitters twitter
                  GROUP BY twitter.user
                  HAVING ( COUNT(*) > 1 )
                  ORDER BY COUNT(*) DESC LIMIT #{limit}
    SQL

    self.find_by_sql(sanitize_sql(query))

  end

end
