require 'rails_helper'

RSpec.describe "/expenses", type: :request do
  let(:valid_attributes) {
    { item: "item 1", amount: 1.0, payment_status: 'unpaid' }
  }

  let(:invalid_attributes) {
    { item: 1, amount: "SomeString", payment_status: 2 }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Expense.create! valid_attributes
      get expenses_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      expense = Expense.create! valid_attributes
      get expense_url(expense)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_expense_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      expense = Expense.create! valid_attributes
      get edit_expense_url(expense)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Expense" do
        expect {
          post expenses_url, params: { expense: valid_attributes }
        }.to change(Expense, :count).by(1)
      end

      it "redirects to the created expense" do
        post expenses_url, params: { expense: valid_attributes }
        expect(response).to redirect_to(expense_url(Expense.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Expense" do
        expect {
          post expenses_url, params: { expense: invalid_attributes }
        }.to change(Expense, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post expenses_url, params: { expense: invalid_attributes }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { item: "new item description", amount: 2.0, payment_status: 'paid' }
      }

      it "updates the requested expense" do
        expense = Expense.create! valid_attributes
        patch expense_url(expense), params: { expense: new_attributes }
        expense.reload
        expect(response.body).not_to be_empty
        expect(response).to have_http_status(302)
      end

      it "redirects to the expense" do
        expense = Expense.create! valid_attributes
        patch expense_url(expense), params: { expense: new_attributes }
        expense.reload
        expect(response).to redirect_to(expense_url(expense))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        expense = Expense.create! valid_attributes
        patch expense_url(expense), params: { expense: invalid_attributes }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested expense" do
      expense = Expense.create! valid_attributes
      expect {
        delete expense_url(expense)
      }.to change(Expense, :count).by(-1)
    end

    it "redirects to the expenses list" do
      expense = Expense.create! valid_attributes
      delete expense_url(expense)
      expect(response).to redirect_to(expenses_url)
    end
  end
end
