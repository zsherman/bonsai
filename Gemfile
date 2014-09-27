source 'https://rubygems.org'
ruby '2.1.2'
gem 'rails', '4.1.6'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring',        group: :development
gem 'devise'
gem 'figaro', '>= 1.0.0.rc1'
gem 'foundation-rails', '5.4.3.1'
gem 'high_voltage'
gem 'pundit'
gem 'simple_form'
gem 'upmin-admin'
gem 'pg'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
#gem 'shoppe', '1.0.3', :git => 'https://github.com/zsherman/core.git'
gem 'shoppe', path: "../core"
gem 'kaminari', '~> 0.15.1'
group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_21]
  gem 'quiet_assets'
  gem 'rails_layout'
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
  gem 'sqlite3'
  gem 'thin'
end
group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'unicorn'
end
group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end
