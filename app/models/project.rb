class Project < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :working
  belongs_to :user

  def change_status
    self.working = !working
    save
    #debugger
    #""
  end
end
