Rails.application.routes.draw do
  root 'import#index'
  match 'load' => 'import#load', via: 'post'
end
