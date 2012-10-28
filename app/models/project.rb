class Project < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :begining
  belongs_to :user
  has_many :intervals

  def change_status
    unless begining
      self.begining = Time.now
    else
      intervals.create(:start => begining, :end => Time.now)
      self.begining = nil
    end
    save
    #debugger
    #""
  end
end
