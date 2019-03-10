Rails.application.routes.draw do
  
  get    '/questions',              to: 'questions#index',   as: 'question_index'
  post   '/questions',     to: 'questions#create',  as: 'question_create'

  get    '/questions/:q/answers',              to: 'answers#index',    as: 'answers_index'
  post   '/questions/:q/answers',              to: 'answers#create',   as: 'answer_create'
  get    '/questions/:q/answers/:a/edit',      to: 'answers#edit',     as: 'answer_edit'
  put    '/questions/:q/answers/:a',           to: 'answers#update',   as: 'answer_update'
  delete '/questions/:q/answers/:a',           to: 'answers#destroy',  as: 'answer_destroy'
  put    '/answers/:a/vote', to: 'answers#vote', as: 'vote_update'


end
