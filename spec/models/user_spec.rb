require 'rails_helper'

RSpec.describe User, type: :model do
  before(:example) do
    @company = Company.new(name: 'test', subdomain: 'test3.localhost:3000')
    @company.save
  end
  it 'is valid with valid attributes' do
    expect(User.new(company_id: @company.id, email: 'test@gmail.com', password: 'hamza1', password_confirmation: 'hamza1')).to be_valid
  end
  it 'is not valid without an email' do
    expect(User.new(email: '', password: 'hamza1', password_confirmation: 'hamza1')).to_not be_valid
  end
  it 'is not valid without an email' do
    expect(User.new(email: '', password: '', password_confirmation: 'hamza1')).to_not be_valid
  end
  it 'is not valid without an email' do
    expect(User.new(email: '', password: 'hamza1', password_confirmation: '')).to_not be_valid
  end
end
