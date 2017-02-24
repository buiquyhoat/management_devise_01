source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bcrypt", "3.1.11"
gem "rails", "~> 5.0.1"
gem "mysql2", ">= 0.3.18", "< 0.5"
gem "puma", "~> 3.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "mini_magick", "4.5.1"
gem "coffee-rails", "~> 4.2"
gem "jquery-turbolinks"
gem "rubocop"
gem "jquery-rails"
gem "jquery-ui-rails"
gem "jbuilder", "~> 2.5"
gem "will_paginate", "3.1.0"
gem "bootstrap-will_paginate", "0.0.10"
gem "bootstrap-sass", "~>3.3.6"
gem "config"
gem "chosen-rails"
gem "i18n-js", "~> 3.0.0.rc11"
gem "bootstrap-datepicker-rails"
gem "figaro"
gem "remotipart", "~> 1.2"
gem "carrierwave"
gem "ransack"
gem "delayed_job"
gem "delayed_job_active_record"
gem "devise"
gem "faker", "1.4.2"
gem "roo"
gem "activerecord-import"

group :development, :test do
  gem "byebug", platform: :mri
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "rspec-activemodel-mocks"
  gem "simplecov", require: false
  gem "shoulda-matchers", "3.1"
end

group :production do
  gem "pg", "0.18.4"
end

group :development, :test do
  gem "rspec-rails", "3.5"
  gem "factory_girl_rails", require: false
  gem "database_cleaner", "~> 1.5"
  gem "rspec-collection_matchers"
  gem "rails-controller-testing"
  gem "capybara"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
