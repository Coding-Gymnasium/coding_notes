# CKC Website One Page Project

## Description

This site includes:

1. Rails to run sendgrid
2. React for the front end to go beyond HTML and CSS3. Potentially I could have used vanilla javaScript but I want to practice using React.


## Steps

	1. '$ rails new ckc_site -T --webpack=react -d=postgresql`
	2. Set up Gemfile:
		- Added Rspec-rails,
		- Pry, 
		- Figaro, and 
		- Simplecov
	3. Initial Installation
		- $ rails generate rspec:install
		- $ bundle exec figaro install
		- $ bundle install
		- Add simplecov configuration
			- add it to .gitignore
			- add include to spec-helper
	4. Sendgrid
		- Installation:
			- gem 'sendgrid-ruby'(https://github.com/sendgrid/sendgrid-ruby)
				- gem 'sendgrid-ruby', '~> 6.3', '>= 6.3.9'
			- set up the development environment variables.
			`$ echo "export SENDGRID_API_KEY='YOUR_API_KEY'" > sendgrid.env`
			`echo "sendgrid.env" >> .gitignore`
			`source ./sendgrid.env`
			- Add RSpec test
	5. React form
			- Create component
				- Create components folder
				- Create App.js	
				- Refactor 'hello_react.jsx'

	6. Contact Form
			- 

### Gemfile

``` ruby

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'
gem 'rails', '~> 6.1.1'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'jbuilder', '~> 2.7'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sendgrid-ruby', '~> 6.3', '>= 6.3.9'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'
# gem 'redis', '~> 4.0'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'figaro' # to hide the keys
  gem 'pry'
  gem 'rspec-rails'
  gem 'simplecov'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

```

