require 'rails_helper'

RSpec.describe "expenses/new", type: :view do
  before(:each) do
    assign(:expense, Expense.new(
      item: "MyString",
      amount: 1,
      payment_status: true
    ))
  end

  it "renders new expense form" do
    render

    assert_select "form[action=?][method=?]", expenses_path, "post" do

      assert_select "input[name=?]", "expense[item]"

      assert_select "input[name=?]", "expense[amount]"

      assert_select "input[name=?]", "expense[payment_status]"
    end
  end
end
