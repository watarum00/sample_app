class ApplicationMailer < ActionMailer::Base
  default from: "watarubus00@gmail.com"#実際に自分で使っているメールアドレス
  layout "mailer"
end
