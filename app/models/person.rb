class Person < ActiveRecord::Base
  has_many :pto_expenses

  def hours_remaining
    alloted_hours - hours_used
  end

  def hours_earned
    hour_groups = []
    (years_since_start+1).times do |i|
      hours = if years_since_start == i
        hours_this_year
      else
        144
      end

      hour_groups << OpenStruct.new(year: start_date.year+1+i, hours: hours)
    end
    hour_groups
  end

  def hours_in_year(year)
    
  end

  def hours_this_year
    (months_since_start % 12) * 12
  end

  def years_since_start 
    years = Date.today.year - start_date.year
    years -= 1 if (
         start_date.month >  Date.today.month or 
        (start_date.month >= Date.today.month and start_date.day > Date.today.day)
    )
    years
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
