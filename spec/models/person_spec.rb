require 'spec_helper'

describe Person do

  subject(:person) { FactoryGirl.create(:person, start_date: 2.months.ago) }

  describe "validations" do
    it { should be_an_instance_of(Person) }
    it { should be_valid }
    it { should have_many(:pto_expenses) }        
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:start_date) }
  end

  context "based on 12 hours per month for 2 months" do
    describe "#hours_remaining" do
      it "returns #total_alloted_hours if there are no expenses" do
        expect(person.hours_remaining).to eq(person.total_alloted_hours.to_f)
      end

      it "is less than #total_alloted_hours if there are expenses" do
        FactoryGirl.create(:pto_expense,
                            person: person,
                            expense_date: Date.today,
                            hours: rand(8..16))

        hours_used = person.pto_expenses.sum(:hours)
        expect(person.hours_remaining.to_i).to be <= person.total_alloted_hours-hours_used
      end
    end

    describe "#total_alloted_hours" do
      it "returns 24 hours earned" do        
        person.total_alloted_hours.should eq(24)
      end

      it "doesn't return more than 24 hours earned" do
        expect(person.total_alloted_hours).to be <= 24
      end
    end    
  end
end
