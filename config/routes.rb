Rails.application.routes.draw do
  get 'expenses/total_debt', to: 'expenses#total_debt', as: :total_debt

  resources :expenses
end
