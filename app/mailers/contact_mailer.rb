class ContactMailer < ApplicationMailer
  default to: 'roiruby0@gmail.com'

  def received_email(contact)
    @contact = contact
    mail(subject: 'Pladuceへのお問い合わせ') do |format|
      format.html
      # format.text
    end
  end
  
  def send_when_contact(contact)
    @contact = contact
    mail to:      contact.email,
         subject: '【Pladuceへのお問い合わせありがとうございます。】'
  end
 
end