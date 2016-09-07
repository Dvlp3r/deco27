class EnquiryMailer < ActionMailer::Base
  default from: 'deco27blog@gmail.com'
 
  def contact_us(enquiry)
    @enquiry = enquiry
    mail(to: 'fabian@deco27.net', subject: 'Contact Us response')
  end
end
