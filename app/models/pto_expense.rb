class PtoExpense < ActiveRecord::Base
  belongs_to :person, touch: true

  def year
    expense_date.year
  end
end
