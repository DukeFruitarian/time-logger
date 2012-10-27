class Project < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :working
  belongs_to :user
end
