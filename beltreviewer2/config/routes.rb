Rails.application.routes.draw do

  get    ''                    => 'sessions#new'    , as:'root'
  get    'sessions/new'        => 'sessions#new'    , as:'sessionsNew'
  post   'sessions'            => 'sessions#create' , as:'sessionsCreate'
  delete 'sessions'            => 'sessions#destroy', as:'sessionsDestroy'

  get    'users/new'           => 'users#new'       , as:'usersNew'
  post   'users'               => 'users#create'    , as:'usersCreate'
  get    'users/:user_id'      => 'users#show'      , as:'usersShow'
  patch  'users/:user_id'      => 'users#update'    , as:'usersUpdate'
  delete 'users/:user_id'      => 'users#destroy'   , as:'usersDestroy'
  get    'users/:user_id/edit' => 'users#edit'      , as:'usersEdit'
  
  #get    'main/:user_id'       => 'users#index'     , as:'main'

  get    'events'                => 'events#index'     , as:'eventsIndex'
  get    'events/new'            => 'events#new'       , as:'eventsNew'
  post   'events'                => 'events#create'    , as:'eventsCreate'
  get    'events/:event_id'      => 'events#show'      , as:'eventsShow'
  patch  'events/:event_id'      => 'events#update'    , as:'eventsUpdate'
  delete 'events/:event_id'      => 'events#destroy'   , as:'eventsDestroy'
  get    'events/:event_id/edit' => 'events#edit'      , as:'eventsEdit'
  post   'events/:event_id/join' => 'events#join'      , as:'eventsJoin'
  post   'events/:event_id/cancel' => 'events#cancel'      , as:'eventsCancel'
  post  'events/:event_id/comments' => 'comments#create'      , as:'commentsCreate'

end
