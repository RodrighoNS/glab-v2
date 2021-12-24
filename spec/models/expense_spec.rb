require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe "Expense model" do
    it { should validate_presence_of(:item) }
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:payment_status) }

    it { is_expected.to validate_inclusion_of(:payment_status).in_array([true, false]) }
  end
end
