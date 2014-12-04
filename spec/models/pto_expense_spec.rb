require 'spec_helper'

describe PtoExpense do

  subject(:pto_expense) { FactoryGirl.create(:pto_expense) }

  describe "validations" do
    it { should be_an_instance_of(PtoExpense) }
    it { should be_valid }
    it { should belong_to(:person) }    
    it { should validate_presence_of(:hours) }
    it { should validate_presence_of(:expense_date) }    
  end
end

