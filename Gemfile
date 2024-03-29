source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.3'

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'rails-db-resetup'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'rack-mini-profiler'
  gem 'rails-flog', require: 'flog'
  gem 'hirb'
  gem 'hirb-unicode'
  gem 'awesome_print'
  gem 'quiet_assets'
  gem 'annotate', git: 'git://github.com/ctran/annotate_models.git'
  gem 'database_rewinder'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller' # その場でデバッグするには必要
  gem 'rails-erd', github: 'paulwittmann/rails-erd', branch: 'mavericks'
end
group :production, :staging do
  # for AWS
  #gem 'mysql2'
  #gem 'unicorn'

  # for heroku
  gem 'pg'
  gem 'rails_12factor'
end

# Twitter bootstrap
gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'jquery-ui-rails', '~> 5.0.0'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'jquery-turbolinks', '~> 0.2.1'
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'rest-client'

gem 'therubyracer'

gem 'rubocop', require: false

gem 'simple_form'
gem 'rails3-jquery-autocomplete', '~> 1.0.12'

gem 'rmagick', :require => 'RMagick'

# Use Haml
gem 'haml-rails'
#gem 'erb2haml'

# For client side validation
gem 'html5_validators'

gem 'kaminari'

# Use Capistrano for deployment
group :deployment do
  gem 'capistrano', '~> 3.2.1'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano3-unicorn'
  gem 'capistrano-rbenv'
end

# Use debugger
# gem 'debugger', group: [:development, :test]
