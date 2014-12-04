require 'spec_helper'

describe Person do

  subject(:person) { FactoryGirl.create(:person) }

  describe "validations" do
    it { should be_an_instance_of(Person) }
    it { should be_valid }
    it { should have_many(:pto_expenses) }        
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:start_date) }
  end
end
