Rails.application.routes.draw do
  get 'parse'       =>  'parse#word'

  post 'parse'      =>  'parse#word'

  get 'emoji/:id'   =>  'emoji#emoji'

  get 'all'         =>  'emoji#all'

  get 'search'      =>  'emoji#search'
end
