require 'test_helper'

class ErrorNotifierTest <  ActionDispatch::IntegrationTest
   
  test "report_error" do
    get '/carts/wibble' 
    assert_response :redirect  # should redirect to...
    # assert_template ""        # ...store index
    
    mail = ActionMailer::Base.deliveries.last
#    assert_equal "Report error", mail.subject
    assert_equal ["antony.ermolenko@gmail.com"], mail[:to].value
     assert_equal ["antony.ermolenko@gmail.com"], mail[:from].value
  end

end
