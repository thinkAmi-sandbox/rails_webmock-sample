module Api
  class PostsController < ApplicationController
    def index
      # 無意味なリクエストだけど、本来は受け取ったデータを元にあれこれする
      # See https://jsonplaceholder.typicode.com/
      connection = Faraday.new(url: 'https://jsonplaceholder.typicode.com')
      _ = connection.get '/comments?postId=1'

      render json: { data: 'ok' }
    end
  end
end
