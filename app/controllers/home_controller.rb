class HomeController < ApplicationController
  def index
    @crawler_twitters = CrawlerTwitter
    @crawler_twitters_user_most = @crawler_twitters.user_most(10)
    @crawler_twitters_average_time = @crawler_twitters.average_time
  end
end
