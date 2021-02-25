# Shrine

[Docs](shrinerb.com)

Tutorial: [article](https://www.microverse.org/blog/rails-image-upload-using-shrine) [youtube video](https://www.youtube.com/watch?v=jx2CAQrXaMg&feature=emb_logo)

## Tutorial Set up

### step 1.1

`$ rails new photo-app -T`

### step 1.2

/Gemfile

``` ruby
#----
gem 'image_processing', '~> 1.2' # for validations such image size, format, etc

gem 'shrine', '~> 3.3'
```
`$ bundle install`

### step 1.3

Create new initializer file 'shrine.rb'

config/initializers/shrine.rb

```ruby
	require "shrine"
	require "shrine/storage/file_system"
	require "shrine/storage/memory"
	if  Rails.env.test?
	  Shrine.storages = {
	    cache: Shrine::Storage::Memory.new,
	    store: Shrine::Storage::Memory.new,
	  }
	else
	 Shrine.storages = {
	   cache: Shrine::Storage::FileSystem.new("public", prefix:     "uploads/cache"), # temporary
	   store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),       # permanent
	 }
	end
	Shrine.plugin :activerecord    # loads Active Record integration
	Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
	Shrine.plugin :restore_cached_data  # extracts metadata for assigned cached files
	Shrine.plugin :validation_helpers
	Shrine.plugin :validation
```

### step 1.4

Run article scaffold
`$ rails g scaffold Article title body:text image_data:text`

`$ rails db:create && rails db:migrate`

### step 1.5

Create directory app/uploaders and file image_uploader.rb
`$ touch app/uploaders/image_uploader.rb`

app/uploaders/image_uploader
```ruby
	class ImageUploader < Shrine
	 Attacher.validate do
	   validate_mime_type %w[image/jpeg image/png image/webp]
	   validate_max_size  1*1024*1024
	 end
end
```

### step 1.6

Associate the model with the shrine image attribute

app/models/article.rb

```ruby
	class Article < ApplicationRecord
	 include ImageUploader::Attachment(:image)
	 validates :title, presence: true
	end
```

### step 1.7

1. Update controller 'article_params' attribute 'image_data' to 'image'
```ruby
	def article_params
		params.require(:article).permit(:body, :image)
	end
```
2. Update `app/views/articles/_form.html.erb`. Modify field 'image_data'.
```html.erb
	<div class="field">
	 <%= form.label :image %>
	 <%= form.file_field :image %>
	</div>
```
3. Update `app/views/articles/show.html.erb`
```html.erb
	<p>
		<strong>Image data:</strong>
		<%= image_tag @article.image_url if @article.image %>
	</p>
``` 
4. Add logic to cache image url if the form is re-render when an error is flagged.
```ruby
  <div class="field">
    <%= form.label :image %>
    <%= image_tag form.object.image_url if form.object.cached_image_data %>
    <%= form.hidden_field :image, value: form.object.cached_image_data %>
    <%= form.file_field :image %>
  </div>
```

***************** End of Tutorial **

At this point I am able to add a picture to an article and it caches if there is an error in the form an the form re renders.
Next steps are:

- Push files to S3 bucket
- Uploading video and push it to a different bucket than the images.

### Step 2.1

#### Set up storage to S3 bucket

1. In Gemfile/ install
	 `gem "aws-sdk-s3", "~> 1.14"`

2. Set up initializer 
	`config/initializers/shrine.rb`

	```ruby
		require 'shrine'
		require 'shrine/storage/file_system'
		require 'shrine/storage/memory'
		require 'shrine/storage/s3'
		  s3 = Shrine::Storage::S3.new(
		    bucket: 'iklf-user-avatars', # required
		    region: 'us-east-1', # required
		    access_key_id: ENV['S3_ACCESS_KEY'],
		    secret_access_key: ENV['S3_SECRET_ACCESS_KEY']
		  )
		
		if Rails.env.test?
		  Shrine.storages = {
		    cache: Shrine::Storage::Memory.new,
		    store: Shrine::Storage::Memory.new
		  }
		elsif Rails.env.development?
		  Shrine.storages = { cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'), # temporary
		                      store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads') # permanent
		  }
		else
		  s3
		end
		
		#------ Plugins
		Shrine.plugin :activerecord # loads Active Record integration
		Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
		Shrine.plugin :restore_cached_data  # extracts metadata for assigned cached files
		Shrine.plugin :validation_helpers
		Shrine.plugin :validation
	```

3. Uncomment Amazon credentials in /config/storage.yml


