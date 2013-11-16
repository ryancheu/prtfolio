# Primary Author: psaylor

# Cite: http://rubydoc.info/gems/omniauth-github/1.1.1/frames

# use different app credentials in dev and prod so that the redirect_url works in both dev and prod

if Rails.env.development?
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, '3291457d6309f173a8a8', '5990abbf79d10d09547fd66476569b63a68fa84f', scope: "user,repo,gist"
  end

  OmniAuth.config.on_failure = SessionsController.action(:oauth_failure)

elsif Rails.env.production?
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, '3291457d6309f173a8a8', '5990abbf79d10d09547fd66476569b63a68fa84f', scope: "user,repo,gist"
  end

  OmniAuth.config.on_failure = SessionsController.action(:oauth_failure)
end
