require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  setup do
    @test = Product.new(
        title:       'Lorem Ipsum',
        description: 'Wibbles are fun!',
        image_url:   'lorem.jpg',
        price:       19.95
    )
  end

  test "product attributes test" do
    @product = Product.new
    assert @product.invalid?
    title
    description
    price
    image_url
  end

  test 'product price must be postive and greater than 0.01' do
    @test.price = -1
    assert @test.invalid?
    # assert_equal [I18n.translate('errors.messages.greater_than_or_equal_to')], @test.errors[:price]

    @test.price = 0
    assert @test.invalid?
    # assert_equal [I18n.translate('errors.messages.greater_than_or_equal_to')], @test.errors[:price]

    @test.price = 1
    assert @test.valid?
  end

  test 'image url' do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.JPG
         http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc gred.gif/more fred.gif.more }
    ok.each do |name|
      @test.image_url = name
      assert @test.valid?, "#{name} should be valid"
    end
    bad.each do |name|
      @test.image_url = name
      assert @test.invalid?, "#{name} shouldn't be valid"
    end
  end

  test 'product is not valid without a unique title' do
    @test.title = products(:one).title
    assert @test.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], @test.errors[:title]
  end

  def method_missing(name)
    @product.errors[name].any?
  end
end
