require "test_helper"

describe Product do
  let(:product) { Product.new }

  it "must validate product name" do
    product.must_be :invalid?
    product.errors[:name].must_include "can't be blank"
  end
end
