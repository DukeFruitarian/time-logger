class Project < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :begining
  belongs_to :user

  def change_status
    unless begining
      self.begining = Time.now
    else

    end
    save
    #debugger
    #""
  end
end
