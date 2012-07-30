require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :products
  
  
  # A user goes to the index page. They select a product, adding it to their
  # cart, and check out, filling in their details on the checkout form. When
  # they submit, an order is created containing their information, along with a
  # single line item corresponding to the product they added to their cart.
  test 'buyings a product' do
    LineItem.delete_all
    Order.delete_all
    ruby_book = products(:ruby)
    # go to store index page
    get "/"
    assert_response :success
    assert_template "index"
    
    # add item to the cart
    xml_http_request :post, '/line_items', product_id: ruby_book.id
    assert_response :success
    
    cart = Cart.find(session[:cart_id])
    assert_equal 1,cart.line_items.size
    assert_equal ruby_book,cart.line_items[0].product
    
    # check out
    get '/orders/new'
    assert_response :success
    assert_template 'new'
    
    #fill the form & get redirected to the index page
    post_via_redirect '/orders', 
      order: {
        name: "Dave Thomas",
        address: "123 The Street",
        email: "dave@example.com",
        pay_type_id: 1
        }
    assert_response :success
    assert_template 'index'
    cart = Cart.find(session[:cart_id])
    assert_equal 0, cart.line_items.size
    
    # check data in the database
    orders = Order.all
    assert_equal 1, orders.size
    order = orders[0]
    assert_equal "dave@example.com",order.email
    assert_equal "Dave Thomas",order.name
    assert_equal "123 The Street",order.address
    assert_equal 1,order.pay_type_id
    assert_equal 1,order.line_items.size
    
    line_item = order.line_items[0]
    assert_equal ruby_book, line_item.product
    
    # check the send mail
    mail = ActionMailer::Base.deliveries.last
    assert_equal ["dave@example.com"], mail.to
    assert_equal 'Elmor <elmor@elmor.org.ua>', mail[:from].value
    assert_equal "Confirmation email", mail.subject
    
  end
  # check that email's sent on error in cart_controller
  test 'Check email  send on error' do
    get '/carts/erfowiefi';
    assert_response :redirect
    assert_template '/'
    mail = ActionMailer::Base.deliveries.last
    assert_equal ["antony.ermolenko@gmail.com"], mail.to
    assert_equal 'rails@application.report', mail[:from].value
    assert_equal "Error in rails application", mail.subject
  end
  
  # test "the truth" do
  #   assert true
  # end
end
