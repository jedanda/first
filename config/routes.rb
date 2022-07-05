Rails.application.routes.draw do
  # если POST-запрос на сервере придет по адресу /messages
  # его нужно отправить к методу create контроллера messages
  
  #post '/messages', to: 'messages#create'
  #patch '/messages/:id', to: 'messages#update'
  #delete '/messages/:id', to: 'messages#destroy'

  resources :messages
end
