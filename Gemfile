source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.4"
gem "bcrypt", "~> 3.1.18"
gem "faker", "~> 2.21.0"
gem "will_paginate", "~> 3.3.1"
gem "bootstrap-will_paginate", "~> 1.0.0"
gem "bootstrap-sass", "~> 3.4.1"
gem "sassc-rails", "~> 2.1.2"
gem "sprockets-rails"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "puma", "~> 5.0"
gem "bootsnap", require: false
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]


group :development, :test do
  gem "sqlite3", "~> 1.4"
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "rails-controller-testing"
  gem "minitest"
  gem "minitest-reporters"
  gem "guard"
  gem "guard-minitest"
end

group :production do
  gem "pg", "~> 1.3.5"
end
