source 'https://rubygems.org'

gem 'rails', '3.2.7'
gem 'devise'
#gem 'cloudfoundry-devise', :require => 'devise'
gem 'bcrypt-ruby'

#gem 'sqlite3'

group :development, :test do 
	gem 'sqlite3'
	gem 'rspec-rails'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'wdm', :require => false
  gem 'win32console'
end

group :test do
  gem 'factory_girl_rails', '1.4.0'
end

group :production do
  gem 'pg'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'jquery-ui-rails'
end

gem 'jquery-rails'
#gem 'cloudfoundry-jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'