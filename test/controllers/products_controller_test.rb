require "test_helper"

describe ProductsController do
  let(:product) { products :iphone_5 }

  it "gets index" do
    get :index
    response.must_be :success?
    assigns(:products).wont_be :nil?
  end

  it "gets new" do
    get :new
    response.must_be :success?
    assigns(:product).must_be :new_record?
  end

  it "creates product" do
    expect {
      post :create, product: { name: 'test' , price: 10 }
    }.must_change ->{  Product.count }

    must_redirect_to assigns :product

    flash[:notice].must_equal 'Product was successfully created.'
  end

  it "validates product" do
    expect {
      post :create, product: { name: '  ' , price: 10 }
    }.wont_change ->{  Product.count }

    must_render_template :new
  end

  it "shows product" do
    get :show, id: product
    response.must_be :success?
  end

  it "gets edit" do
    get :edit, id: product
    response.must_be :success?
  end

  it "updates product" do
    put :update, id: product, product: { name: 'Other name' }

    assigns(:product).reload.name.must_equal 'Other name'

    must_redirect_to assigns :product

    flash[:notice].must_equal 'Product was successfully updated.'
  end

 it "destroys product" do
    expect {
      delete :destroy, id: product
    }.must_change  'Product.count', -1

    must_redirect_to :products

    flash[:notice].must_equal 'Product was successfully destroyed.'
  end
end
