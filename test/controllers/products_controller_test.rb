require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @update = {
        title:       'Lorem Ipsum',
        description: 'Wibbles are fun!',
        image_url:   'lorem.jpg',
        price:       19.95
    }
  end

  test "should get index" do
    # Attention, syntax like 'get :index' has become invalid for rails 5; use 'get products_url' instead.
    # get :index
    get products_url
    assert_response :success

    # assigns has been extracted to a gem: gem 'rails-controller-testing'
    # assert_not_nil assigns(:products)
  end

  test "should get new" do
    # get :new
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    # 1 by default
    assert_difference('Product.count') do
      # post :create, product: @update
      post products_url, params: { product: @update }
      # post products_url, params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @product.title } }
    end

    # Attention: product_path and product_url??
    # assert_redirected_to product_path(assigns(:product))
    assert_redirected_to product_url(Product.last)
  end

  # ...

  test "should show product" do
    # get :show, id: @product
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    # get :edit, id: @product
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    # patch :update, id: @product, product: @update
    # assert_redirected_to product_path(assigns(:product))

    patch product_url(@product), params: { product: @update }
    assert_redirected_to product_url(@product)
  end

  # ...

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      # delete :destroy, id: @product
      delete product_url(@product)
    end

    assert_redirected_to products_path
  end

end
