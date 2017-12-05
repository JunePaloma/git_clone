Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['Github_client'], ENV['Github_secret'], scope: "user, repo"
end
