module MandrillMailer
  class BackgroundEmail < MandrillMailer::TemplateMailer
    include Sidekiq::Worker

    default from: 'admin@example.com'

    def perform(args)
      email = mandrill_mail(args)
      email.deliver
    end
  end
end
