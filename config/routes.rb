Rails.application.routes.draw do
  namespace :v1 do
    root "base#index"
  end
end
