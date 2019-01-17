require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "user", email: "user@udemy.com", password: "password", admin: true)
    @category1 = Category.create(name: "category1")
    @category2 = Category.create(name: "category2")
  end

  test "get new article form and create article" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: {
        title: "test_article_title",
        description: "New article description",
        category_ids: [@category1.id, @category2.id]
      } }
      follow_redirect!
    end
    assert_match "test_article_title", response.body
    assert_match "category1", response.body
    assert_match "category2", response.body
  end

end
