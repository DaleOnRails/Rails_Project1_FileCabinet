Rails.application.routes.draw do
  devise_for :users
  get "welcome/index"
  #root will set welcome view page and the index controller action as the homepage url (localhost:3000 atm)
  #NOTE: "welcome is the folder name for the view file and index is the name of the view file which by convention has the same name as the index action in the controller!"
  #step-1.5-------------------

  #resources will create all the different routes i will be adding to my application
  resources :docs
  authenticated :user do
    #i need two root directories: 1 for users who ARE logged in. plus 1 for users who ARE NOT logged in. ...for someone who is already logged they get the all docs page as the homepage but for someone who is new they view the standard welcome page.
    root "docs#index", as: "authenticated_root"
  end

  root to: "welcome#index"
end
