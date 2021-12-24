require 'rails_helper'

RSpec.describe "expenses/index", type: :view do
  before(:each) do
    assign(:expenses, [
      Expense.create!(
        item: "Item",
        amount: 2,
        payment_status: true
      ),
      Expense.create!(
        item: "Item",
        amount: 2,
        payment_status: true
      )
    ])
  end

  it "renders a list of expenses" do
    render
    assert_select "tr>td", text: "Item".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Payment Status", count: 2
  end
end
