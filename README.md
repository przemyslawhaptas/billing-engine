# README

A generic template for Rails-based API

1. Replace "rails-api-template" with your app name:n the following files `.ruby-version`, `config/cable.yml` and `config/environments/production.rb`
2. Encrypt your own credentials by removing `config/credentials.yml.enc` and `config/master.key` and recreating them with `EDITOR=vim rails credentials:edit`
3. Setup the db: `rails db:setup; rails db:migrate`
4. Setup CORS settings in `config/application.rb`
5. Setup anti-DDOS settings in 'config/initializers/rack_attack.rb`
6. Consider caching: https://github.com/rails-api/active_model_serializers/blob/v0.10.6/docs/general/caching.md
7. Consider documentation options: https://github.com/Apipie/apipie-rails, https://github.com/fotinakis/swagger-blocks/, "https://github.com/lord/slate"

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
