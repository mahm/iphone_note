source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'pg', group: :production
gem 'thin'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
  gem 'less-rails'
end

gem 'jquery-rails'
gem 'twitter-bootstrap-rails'
gem 'haml', '3.1.6'
gem 'haml-rails'

gem 'simple_form'
gem 'devise'

group :development do
  gem 'heroku_san'
  gem 'erb2haml'
  gem "quiet_assets"
end

group :development, :test do
  gem 'sqlite3'
end
