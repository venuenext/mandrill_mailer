class BackgroundEmail < MandrillMailer::TemplateMailer
  include Sidekiq::Worker

  default from: 'admin@example.com'

  def perform(args)
    formatted_args = args.map {|k,v| k.to_sym if k.is_a?(String)} #sidekiq turns symbols to strings
    email = mandrill_mail(formatted_args)
    email.deliver
  end
end
