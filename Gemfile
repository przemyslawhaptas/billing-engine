source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.0"

gem "active_model_serializers"
gem "bootsnap", ">= 1.1.0", require: false
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.11"
gem "rack-attack"
gem "rack-cors"
gem "rails", "~> 5.2.2"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "rubocop"
end

group :development do
  gem "brakeman"
  gem "bundler-audit"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "mocha"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
