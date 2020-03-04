source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 5.2.3'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'devise-jwt', '~> 0.5.9'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'
gem 'pundit', '~> 2.0', '>= 2.0.1'

group :development, :test do
  gem 'dotenv-rails', '~> 2.7', '>= 2.7.4'
  gem 'factory_bot_rails', '~> 5.0', '>= 5.0.2'
  gem 'ffaker', '~> 2.11'
  gem 'pry', '~> 0.12.2'
  gem 'rspec-rails', '~> 3.8', '>= 3.8.2'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', '~> 0.72.0', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
