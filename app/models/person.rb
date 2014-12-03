class Person < ActiveRecord::Base
  has_many :pto_expenses

  def hours_remaining
    alloted_hours - hours_used
  end

  def hours_earned_in(year)
    today = Date.new(year.to_i,1,1)
    start = start_date 
    (today.year * 12 + today.month) - (start.year * 12 + start.month)
  end

  def hours_used
    pto_expenses.sum(:hours)
  end  

  def alloted_hours
    months_since_start * 12
  end

  def months_since_start
    today = Date.today
    start = start_date 
    (today.year * 12 + today.month) - (start.year * 12 + start.month)
  end
end
