class CrawlerTwittersController < ApplicationController
  before_action :set_crawler_twitter, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create]

  # GET /crawler_twitters
  # GET /crawler_twitters.json
  def index
    @crawler_twitters = CrawlerTwitter.all.order("id DESC").page(params[:page])
  end

  # GET /crawler_twitters/1
  # GET /crawler_twitters/1.json
  def show
  end

  # GET /crawler_twitters/new
  def new
    @crawler_twitter = CrawlerTwitter.new
  end

  # GET /crawler_twitters/1/edit
  def edit
  end

  # POST /crawler_twitters
  # POST /crawler_twitters.json
  def create

    @crawler_twitter = CrawlerTwitter.new(crawler_twitter_params)

    respond_to do |format|
      if @crawler_twitter.save
        format.html { redirect_to @crawler_twitter, notice: t('twitter.created') }
        format.json { render :show, status: :created, location: @crawler_twitter }
      else
        format.html { render :new }
        format.json { render json: @crawler_twitter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crawler_twitters/1
  # PATCH/PUT /crawler_twitters/1.json
  def update
    respond_to do |format|
      if @crawler_twitter.update(crawler_twitter_params)
        format.html { redirect_to @crawler_twitter, notice: t('twitter.updated') }
        format.json { render :show, status: :ok, location: @crawler_twitter }
      else
        format.html { render :edit }
        format.json { render json: @crawler_twitter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crawler_twitters/1
  # DELETE /crawler_twitters/1.json
  def destroy
    @crawler_twitter.destroy
    respond_to do |format|
      format.html { redirect_to crawler_twitters_url, notice: t('twitter.destroyed') }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_crawler_twitter
    @crawler_twitter = CrawlerTwitter.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def crawler_twitter_params
    params.require(:crawler_twitter).permit(:content, :user, :tags, :publish)
  end
end
