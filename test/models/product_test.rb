require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  #test "product is not valid without a unique title" do
  #  product = Product.new(title: products(:ruby).title,
  #                        description: "blahblahblah",
  #                        price: 1,
  #                        image_url: "jax.gif")
  #  assert product.invalid?
  #  assert_equal ["has  already been taken"], product.errors[:title]
  #end
  # test "the truth" do
  #   assert true
  # end
  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be positive number" do
  	product = Product.new(title: "My Book Title",
  		                  description: "blahblahblah",
  		                  image_url: "blah.jpg")
  	product.price = -1
  	assert product.invalid?
  	assert_equal ["must be greater than or equal to 0.01"],
  	  product.errors[:price]

  	product.price = 0
  	assert product.invalid?
  	assert_equal ["must be greater than or equal to 0.01"],
  	  product.errors[:price]

  	product.price = 1
  	assert product.valid?
  end

  def new_product(image_url)
    Product.new(title: "My Book Title",
                description: "blahblahblah",
                price: 1,
                image_url: image_url)
  end
  test "image_url" do
    ok = %w{ jax.gif jax.jpg jax.png JAX.GIF JAX.JPG JAX.PNG JAX.jpg
            http://a.b.c/x/y/z/jax.gif }
    bad = %w{ jax.doc jax.gif/more jax.gif.more }

    ok.each do |name|
      assert new_product(name).valid?, "#{name} should be valid"
    end
    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end
end

