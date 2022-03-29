source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

######################################################################
# Rails Framework
######################################################################
gem 'rails'
gem 'rake'
gem 'puma'
gem 'turbolinks'

group :production do
  gem 'pg' # Must make sure libpq-dev is installed on Ubuntu
end

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring', '~> 3.0.0w'
  # gem 'spring-watcher-listen'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

######################################################################
# UI Framework
######################################################################
gem 'materialize-sass'
gem 'font-awesome-sass'

gem 'sass-rails'

######################################################################
# JS Framework
######################################################################
gem 'jquery-rails'
gem 'jbuilder'

# JS runtime
gem 'execjs'
gem 'mini_racer', '~> 0.4'

######################################################################
# Utilities
######################################################################
gem 'google_sign_in'
