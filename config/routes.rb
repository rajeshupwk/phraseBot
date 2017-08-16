Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "phrases#index"
  get "fetch_phrase", to: "phrases#fetch_phrase"
  resource	:phrases
end
