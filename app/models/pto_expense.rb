class PtoExpense < ActiveRecord::Base
  belongs_to :person

  def year
    expense_date.year
  end
end
