source 'https://rubygems.org'

# Ruby version
ruby '2.2.1'

# Default gems
gem 'rails',        '4.2.1'
gem 'authlogic',    '3.4.5'
gem 'sucker_punch', '1.4.0'
gem 'pg',           '0.18.1'

# APIs
gem 'active_model_serializers'

# File uploads
gem 'mini_magick',  '4.2.3'
gem 'refile',       '0.5.4',
  require: ['refile/rails', 'refile/image_processing']

# Assets
gem 'sass-rails',   '5.0.2'
gem 'uglifier',     '2.7.1'
gem 'coffee-rails', '4.1.0'
gem 'jquery-rails', '4.0.3'
gem 'turbolinks',   '2.5.3'
gem 'haml-rails',   '0.9.0'
gem 'react-rails',  '1.0.0'

# Development gems
group :development, :test do
  gem 'byebug',             '4.0.5'
  gem 'web-console',        '2.1.2'
  gem 'spring',             '1.3.6'
  gem 'quiet_assets',       '1.1.0'
  gem 'faker',              '1.4.3'
  gem 'hirb'
end

# Production gems
group :production do
  gem 'rails_12factor'
  gem 'puma'
  gem 'dalli'
  gem 'memcachier'
end
