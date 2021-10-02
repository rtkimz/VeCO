Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "publishers#index"
  
  get "publishers" => "publishers#index"
  get "publisher/:id" => "publishers#show", as: "publisher"

  get "character/:id" => "characters#show", as: "character"

  get "titles" => "titles#index"
  get "title/:id" => "titles#show", as: "title"

end
