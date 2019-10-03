Rails.application.routes.draw do
  get "welcome/index"
  #root will set welcome view page and the index controller action as the homepage url (localhost:3000 atm)
  #NOTE: "welcome is the folder name for the view file and index is the name of the view file which by convention has the same name as the index action in the controller!"
  root "welcome#index"
  #this will create all the different routes i will be adding to my application
  resources :docs
end
