require 'rails_helper'
require 'byebug'

RSpec.describe Expense, type: :model do
  describe "model" do
    it { should validate_presence_of(:item) }
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:payment_status) }
  end
end
