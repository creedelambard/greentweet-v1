class ProposedTweetsController < ApplicationController
  before_action :set_proposed_tweet, only: [:show, :edit, :update, :destroy]

  # GET /proposed_tweets
  # GET /proposed_tweets.json
  def index
    @proposed_tweets = ProposedTweet.all
  end

  # GET /proposed_tweets/1
  # GET /proposed_tweets/1.json
  def show
  end

  # GET /proposed_tweets/new
  def new
    @proposed_tweet = ProposedTweet.new
  end

  # GET /proposed_tweets/1/edit
  def edit
  end

  # POST /proposed_tweets
  # POST /proposed_tweets.json
  def create
    @proposed_tweet = ProposedTweet.new(proposed_tweet_params)

    respond_to do |format|
      if @proposed_tweet.save
        format.html { redirect_to @proposed_tweet, notice: 'Proposed tweet was successfully created.' }
        format.json { render :show, status: :created, location: @proposed_tweet }
      else
        format.html { render :new }
        format.json { render json: @proposed_tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proposed_tweets/1
  # PATCH/PUT /proposed_tweets/1.json
  def update
    respond_to do |format|
      if @proposed_tweet.update(proposed_tweet_params)
        format.html { redirect_to @proposed_tweet, notice: 'Proposed tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @proposed_tweet }
      else
        format.html { render :edit }
        format.json { render json: @proposed_tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proposed_tweets/1
  # DELETE /proposed_tweets/1.json
  def destroy
    @proposed_tweet.destroy
    respond_to do |format|
      format.html { redirect_to proposed_tweets_url, notice: 'Proposed tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposed_tweet
      @proposed_tweet = ProposedTweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proposed_tweet_params
      params.require(:proposed_tweet).permit(:user_id, :description, :hashtags)
    end
end
