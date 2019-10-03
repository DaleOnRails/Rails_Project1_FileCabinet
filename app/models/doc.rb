class Doc < ApplicationRecord
  #says documents belong to a user (and in user.rb....)
  belongs_to :user
end
