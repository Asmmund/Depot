require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Confirmation email", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["elmor@elmor.org.ua"], mail.from
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Your item\'s been shipped!", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["elmor@elmor.org.ua"], mail.from
  end
  

end
