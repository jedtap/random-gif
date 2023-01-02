class PagesController < ApplicationController
  def home
    @recent = Search.all.last(5).reverse

    response = RestClient.get('https://api.giphy.com/v1/gifs/translate?api_key=' + ENV["KEY"] + '&s=' + 'eagle')
    json = JSON.parse(response)
    @url = json['data']['images']['downsized_medium']['url']
  end

  def download
    @queries = Search.all.reverse.group_by{|x| x.created_at.strftime("%Y-%m-%d")} 
  end

  def downloadDay
    @queries = Search.all.group_by{|x| x.created_at.strftime("%Y-%m-%d")} 
    render json: @queries[params[:day]]
  end
end
