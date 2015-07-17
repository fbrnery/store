require "test_helper"

describe Product do
  let(:product) {
    Product.new name: 'iPhone 6', price: 1000
  }

  it "must validate product name presence" do
    product.name = '    '
    product.must_be :invalid?
    product.errors[:name].must_include "can't be blank"
  end

  it "must validate product price" do
    product.price = nil
    product.must_be :invalid?
    product.errors[:price].must_include "can't be blank"
  end

  it "must validate product price is not negative" do
    product.price = -1
    product.must_be :invalid?
    product.errors[:price].must_include "must be greater than 0"
  end

  it "must validate product price is not zero" do
    product.price = 0
    product.must_be :invalid?
    product.errors[:price].must_include "must be greater than 0"
  end
end
