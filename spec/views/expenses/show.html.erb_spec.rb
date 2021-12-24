require 'rails_helper'

RSpec.describe "expenses/show", type: :view do
  before(:each) do
    @expense = assign(:expense, Expense.create!(
      item: "Item",
      amount: 2,
      payment_status: true
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Item/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Payment Status/)
  end
end
