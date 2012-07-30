require 'test_helper'

class ErrorNotifierTest < ActionMailer::TestCase
  test "report_error" do
    get '/carts/wibble' 
    assert_response :redirect  # should redirect to...
    assert_template "/"        # ...store index
    
    mail = ActionMailer::Base.deliveries.last
#    assert_equal "Report error", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
  end

end
