class Person < ActiveRecord::Base
  has_many :pto_expenses
  HOURS_PER_MONTH = 12

  def hours_remaining
    total_alloted_hours - hours_used
  end

  def total_alloted_hours
    alloted_hours(months_since_start)
  end

  def hours_in_year(year)    
    if start_date.advance(years: year - start_date.year) < Date.today
      alloted_hours
    else
      hours_this_year
    end
  end

  def years_employed
    start_year = start_date.year + 1
    end_year   = start_year + years_since_start
    (start_year..end_year).to_a
  end

  private

  def hours_this_year
    alloted_hours(months_since_start % 12)
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

  def alloted_hours(months=12)
    months * HOURS_PER_MONTH
  end

  def months_since_start
    today = Date.today
    start = start_date 
    (today.year * 12 + today.month) - (start.year * 12 + start.month)
  end
end
