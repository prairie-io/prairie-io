require "raven"

Raven.configure do |config|
  config.async = lambda { |event|
    Thread.new { Raven.send(event) }
  }
  config.dsn = ENV["SENTRY_DSN"]
  config.environments = ["production"]
  config.tags = { environment: Rails.env }
end

Devise::SessionsController.class_eval do
  after_filter :set_raven_user_context, only: [:create]
  after_filter :clear_raven_user_context, only: [:destroy]

private

  def set_raven_user_context
    user = current_user || current_admin_user
    # bind the logged in user
    Raven.user_context id: user.id, email: user.email, name: user.name
  end

  def clear_raven_user_context
    Raven.user_context
  end
end
