# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.5.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'activevalidators', '~> 4.1'
gem 'devise', '~> 4.4'
gem 'jbuilder', '~> 2.5'
gem 'kaminari'
gem 'mailgun-ruby', '~>1.1.6'
gem 'omniauth-linkedin-oauth2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'capybara', '~> 2.13'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.6'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 3.1', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'reek'
  gem 'rubocop'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
