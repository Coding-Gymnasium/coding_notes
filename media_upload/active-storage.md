# Active Storage

## Practice using the following resources for guidance:

- [pragmaticstudio.com tutorial](https://pragmaticstudio.com/tutorials/using-active-storage-in-rails)
- [Documentation](https://edgeguides.rubyonrails.org/active_storage_overview.html)

## App step by step

### Initial Set up

#### Step 1.1

- `$ rails new active_strg_app_1 -T -d=postgresql`
- `$ git branch -m main`
- `$ rbenv local 2.7.0`
- Gemfile:
	- Add gems:
		- rspec-rails, 
		- pry,
		- figaro,
		- image_processing
- `$ bundle install`
- `$ db:create`
- `$ rails g rspec:install` 
- `$ bundle exec figaro install`

#### Step 1.2

- `$ rails active_storage:install`
- `$ rails db:migrage`

#### Step 1.3

- `$ rails g scaffold User name`
- `$ rails db:migrate`

#### Step 1.4

- Add `has_one_attached :avatar` to user model
- Add `<%= form.file_field :avatar %>` to user form partial
- Add `:avatar` to private user params
- Add `image_tag` to user's show and index views

#### Step 1.5

Setting up S3:
[Link to the documentation](https://edgeguides.rubyonrails.org/active_storage_overview.html#s3-service-amazon-s3-and-s3-compatible-apis)


