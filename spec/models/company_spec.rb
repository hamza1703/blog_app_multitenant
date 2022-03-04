require 'rails_helper'

RSpec.describe Company, type: :model do
  before(:example) do
    @company = Company.new(name: 'test', subdomain: 'test3.localhost:3000')
    @company.save
  end

  it 'is valid with valid attributes' do
    expect(Company.new(name: 'test', subdomain: 'test4.localhost:3000')).to be_valid
  end
  it 'is not valid without a name' do
    expect(Company.new(name: '', subdomain: 'test4.localhost:3000')).to_not be_valid
  end

  it 'is not valid without a subdomain' do
    expect(Company.new(name: 'test', subdomain: '')).to_not be_valid
  end
end
