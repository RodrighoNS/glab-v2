require 'rails_helper'

RSpec.describe "expenses/index", type: :view do
  before(:each) do
    assign(:expenses, [
      Expense.create!(
        item: "Item",
        amount: 2,
        payment_status: 'unpaid'
      ),
      Expense.create!(
        item: "Item",
        amount: 2,
        payment_status: 'unpaid'
      )
    ])
  end

  it "renders a list of expenses" do
    render
    assert_select "tr>td", text: "Item", count: 2
    assert_select "tr>td", text: "unpaid", count: 2
  end
end
