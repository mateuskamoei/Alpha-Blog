require 'test_helper'

class ArticleCategoryTest < ActiveSupport::TestCase

  def setup
    @user = User.create(username: "mateus", email: "mateus@udemy.com", password: "password")
    @category = Category.create(name: "Sports")
    @article = Article.create(title: "Test Article", description: "This is a test description", user: @user)
  end

  test "article category link" do
    assert_difference 'ArticleCategory.count', 1 do
      @article.categories << @category
    end
  end

  test "category article link" do
    assert_difference 'ArticleCategory.count', 1 do
      @category.articles << @article
    end
  end

end
