# IKLF Competitions website

## Description

www.kettlebellcompetitions.com a website to create and manage competitions and for users to register, submit videos and results, apply for ranking, and pay for IKLF competition/ranking activities.

## Initial Set Up

### Steps

  1. `$ rails new kb-comp-mono -T -d=postgresql --webpack=react`
  2. Set up Gemfile
    - Add testing suite: rspec-rails, pry, capybara, shoulda-matchers, rubocop
  3. ran `$ rails g rspec:install`
  4. Add shoulda-matchers configuration to rails-helper
    ``` ruby
      Shoulda::Matchers.configure do |config|
        config.integrate do |with|
          with.test_framework :rspec
          with.library :rails
        end
      end
  ```  
  5. Add rubocop
    - Add rubocop to gemfile development group
      ``` ruby
        gem 'rubocop', require: false
        gem 'rubocop-rails', require: false
        gem 'rubocop-rspec', require: false
      ```
    - touch .rubocop.yml in root directory
      ``` ruby
      require:
      - rubocop
      - rubocop-rails
      - rubocop-rspec
      
      AllCops:
        Exclude:
          - 'bin/**/*'
          - 'config/**/*'
          - 'coverage/**/*'
          - 'db/**/*'
          - 'lib/**/*'
          - 'log/**/*'
          - 'node_modules/**/*'
          - 'public/**/*'
          - 'spec/**/*'
          - 'tmp/**/*'
          - 'vendor/**/*'
          - './*'
        NewCops: enable
      
      Style/FrozenStringLiteralComment:
        Enabled: false
      
      Style/Documentation:
        Enabled: false
      
      Style/ClassAndModuleChildren:
        Enabled: false
      
      Style/SafeNavigation:
        Enabled: false
      
      Metrics/AbcSize:
        Enabled: false
      ```
  6. Add simplecov to group development test in Gemfile
    - Add simplecov to .gitignore    

    ``` ruby
    #------ Simplecov
    /coverage/*
    /coverage.data
    ```

## Stages

### Stage 1

- There is a form for to enter a lifter's competition data (no login or state yet)

  1. Create view pages/home.html.erb
  2. Create pages controller with action 'home'. pages_controller.rb
  3. Set root to: 'pages#home' 
  4. Temporarily add <%= javascript_pack_tag 'hello_react' %> for initial visualization.
  5. Run rails s
