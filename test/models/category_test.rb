require "test_helper"
require 'faker'

class CategoryTest < ActiveSupport::TestCase
  test "Prevent create category with duplicated slug" do
    category = Category.new({slug: Category.first.slug})

    assert_not category.save
  end

  test "Create category successfully" do
    category = Category.new(
      {
        slug: Faker::Name::unique,
        name: "Electronics",
        description: Faker::String::random(length: 50),
        status: "active"
      }
    )

    category.save

    assert_equal(category.name, "Electronics")
  end
end
