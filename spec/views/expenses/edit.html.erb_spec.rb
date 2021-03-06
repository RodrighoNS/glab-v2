require 'rails_helper'

RSpec.describe "expenses/edit", type: :view do
  before(:each) do
    @expense = assign(:expense, Expense.create!(
      item: "MyString",
      amount: 1.0,
      payment_status: "unpaid"
    ))
  end

  it "renders the edit expense form" do
    render

    assert_select "form[action=?][method=?]", expense_path(@expense), "post" do

      assert_select "input[name=?]", "expense[item]"

      assert_select "input[name=?]", "expense[amount]"

      assert_select "select[name=?]", "expense[payment_status]"
    end
  end
end
