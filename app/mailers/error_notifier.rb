class ErrorNotifier < ActionMailer::Base
  default from: "rails@application.report"
  default to: "antony.ermolenko@gmail.com"
  default subject: 'Error in rails application'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.error_notifier.report_error.subject
  #
  def report_error(error)
    @error = error
    mail 
  end
end
