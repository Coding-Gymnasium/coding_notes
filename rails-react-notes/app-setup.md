# Rails React App Setup

setting up from scratch using webpacker

To set up an app without database and with the standard rails set up:

`$ rails new my_app_name --webpacker=react`  
or
`$ rails new my_app_name -T -d=postgresql --webpacker=react`  

To add rails to and existing app:

`$ rails webpacker:install:react`
