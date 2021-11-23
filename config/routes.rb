Rails.application.routes.draw do
  namespace 'api' do
    get 'posts', to: 'posts#index'
  end
end
