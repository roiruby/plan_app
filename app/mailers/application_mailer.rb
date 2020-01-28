class ApplicationMailer < ActionMailer::Base
  default from: "Pladuce【プラデュース】 <info@pladuce.jp>",
  reply_to: "info@pladuce.jp"
  layout 'mailer'
end
