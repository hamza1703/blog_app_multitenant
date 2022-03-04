require 'rails_helper'

RSpec.describe Article, type: :model do
  before(:example) do
    @company = Company.new(name: 'testdedc', subdomain: 'test3444.localhost:3000')
    @user = @company.users.build(email: 'test5343@gmail.com', password: 'hamza1', password_confirmation: 'hamza1')
    @company.save
    Company.current_tenant_id = @company.id
  end
  it 'is valid with valid attributes' do
    expect(@user.articles.build(company_id: @company.id, user_id: @user.id, title: 'my article', body: 'testing data').save).to eq true
  end
  it 'is not valid without a title' do
    expect(@user.articles.build(company_id: @company.id, user_id: @user.id, title: '', body: 'testing data').save).to eq false
  end
  it 'is not valid without a body' do
    expect(@user.articles.build(company_id: @company.id, user_id: @user.id, title: 'my article', body: '').save).to eq false
  end
end
