require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:example) do
    @company = Company.new(name: "testdedc", subdomain:"test3444.localhost:3000")
    @user = @company.users.build(email: "test5343@gmail.com", password:"hamza1", password_confirmation:"hamza1")
    @company.save
    Company.current_tenant_id = @company.id
    @article = @user.articles.build(company_id: @company.id, title: "my article", body:"testing data")
  end

  it "is valid with valid attributes" do
    expect(@article.comments.build(company_id: @company.id, user_id: @user.id, article_id: @article.id, commenter: "hamza", body:"testing data")).to be_valid
  end
  it "is not valid without a commenter" do
    expect(@article.comments.build(company_id: @company.id, user_id: @user.id, article_id: @article.id, commenter: "", body:"testing data")).to_not be_valid
  end
  it "is not valid without a body" do
    expect(@article.comments.build(company_id: @company.id, user_id: @user.id, article_id: @article.id, commenter: "hamza", body:"")).to_not be_valid
  end
end
