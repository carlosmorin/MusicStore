require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  let(:product) {
    Product.create!(
      name: "MyString",
      price: 1.5,
      status: 1,
      quantity: 1,
      user: nil
    )
  }

  before(:each) do
    assign(:product, product)
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(product), "post" do

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[price]"

      assert_select "input[name=?]", "product[status]"

      assert_select "input[name=?]", "product[quantity]"

      assert_select "input[name=?]", "product[user_id]"
    end
  end
end
