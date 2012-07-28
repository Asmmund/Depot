class OrderNotifier < ActionMailer::Base
  default from: "Elmor <elmor@elmor.org.ua>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order=order
    mail to: order.email, subject:"Confirmation email"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @order=order
    mail to: order.email, subject:"Your item\'s been shipped!"
  end
end
