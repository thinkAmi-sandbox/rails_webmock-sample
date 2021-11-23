require 'rails_helper'

RSpec.describe 'Post API', type: :request do
  describe 'GET /api/posts' do
    context 'stub失敗' do
      before do
        stub_request(:get, 'https://jsonplaceholder.typicode.com/comments').to_return(status: 200)
      end

      it 'リクエストが成功すること' do
        pending 'クエリ文字列がないので失敗する'
        get '/api/posts'
        expect(response).to have_http_status(200)
      end
    end

    context 'URLにクエリ文字列を含める' do
      before do
        stub_request(:get, 'https://jsonplaceholder.typicode.com/comments?postId=1').to_return(status: 200)
      end

      it 'リクエストが成功すること' do
        get '/api/posts'
        expect(response).to have_http_status(200)
      end
    end

    context 'withでクエリ文字列を指定' do
      before do
        stub_request(:get, 'https://jsonplaceholder.typicode.com/comments')
          .with(
            query: {
              'postId' => 1
            }
          )
          .to_return(status: 200)
      end

      it 'リクエストが成功すること' do
        get '/api/posts'
        expect(response).to have_http_status(200)
      end
    end

    context '正規表現でstub' do
      before do
        stub_request(:get, %r{jsonplaceholder.typicode.com})
          .to_return(status: 200)
      end

      it 'リクエストが成功すること' do
        get '/api/posts'
        expect(response).to have_http_status(200)
      end
    end
  end
end
