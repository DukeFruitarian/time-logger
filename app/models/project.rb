class Project < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :begining
  belongs_to :user
  has_many :intervals, :dependent => :destroy
  validates :title, :presence => true

  # метод добавляющий время начало работы или создание нового интервала
  #   при завершении работы
  def change_status
    unless begining
      self.begining = Time.now
    else
      intervals.create(:start => begining, :end => Time.now)
      self.begining = nil
    end
    save
  end

  # метод для вычисления общего количества времени работы над проектом
  def total_spent
    total = intervals.inject(0) do |total,interval|
      interval.end - interval.start + total
    end.to_i
    days = total/60/60/24
    hours = total/60/60 - days*24
    minutes = total/60 - days*24*60 - hours*60
    [days,hours,minutes]
  end
end
