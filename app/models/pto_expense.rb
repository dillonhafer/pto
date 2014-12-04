class PtoExpense < ActiveRecord::Base
  belongs_to :person, touch: true
  validates_presence_of :expense_date, :hours

  def year
    expense_date.year
  end
end
