source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'jquery-rails'
gem 'haml-rails'
gem 'paperclip'
gem 'simple_form'
gem 'bootstrap-sass'
gem 'factory_girl_rails'
gem 'aws-sdk'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'sqlite3'
  gem 'shoulda'
end

group :development do
  gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
end