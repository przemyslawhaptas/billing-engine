# README

Setup
1. Run `gem install bundler`
2. Run `bundle`
3. Run `rails db:setup`
4. Create an internal authentication token with `rake authentication:generate_token`
5. Encrypt your own credentials: `rm config/credentials.yml.enc; rm config/master.key; EDITOR=vim rails credentials:edit`
6. Run server `rails server`
6. Here is an example `POST /v1/subscriptions` endpoint request payload:
```
  {
     "data" => {
       "id" => nil,
       "type" => "subscription",
       "attributes" => {
         "shipping" => {
           "name" => "Iris Watson",
           "address" => "P.O. Box 283 8562 Fusce Rd.",
           "zip_code" => "20620"
         },
         "credit_card" => {
           "card_number" => "4242424242424242",
           "expiration_month" => "01",
           "expiration_year" => "2024",
           "cvv" => "123",
           "zip_code" => "20620"
         },
         "product_id" => "gold",
         "customer_id" => nil
       }
     }
  }
```
7. The only supported `product_id`s are `"gold"`, `"silver"` and `"bronze"`
7. On failure, the endpoint will return status code `400` and an array of errors like
```
["Purchases for existing customers are not implemented"]
```
8. On success, the endpoint will return status code `200`
7. You can call the endpoint like this:
```
# Request
curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Token token=23f3ff5ba28c491" \
  -d '{"data"=>{"id"=>nil, "type"=>"subscription", "attributes"=>{"shipping"=>{"name"=>"Iris Watson", "address"=>"P.O. Box 283 8562 Fusce Rd.", "zip_code"=>"20620"}, "credit_card"=>{"card_number"=>"4242424242424242", "expiration_month"=>"01", "expiration_year"=>"2024", "cvv"=>"123", "zip_code"=>"20620"}, "product_id"=>"gold", "customer_id"=>nil}}}' \
  localhost:3000/v1/subscriptions
```
8. You can add `rake scheduled:billing` to cron to automate monthly billing
9. You can run the test suite with `rails test`

Things to consider:
1. Configure CORS settings in `config/application.rb`
2. Configure anti-DDOS settings in `config/initializers/rack_attack.rb`
4. Consider documentation options: https://github.com/Apipie/apipie-rails, https://github.com/fotinakis/swagger-blocks/, "https://github.com/lord/slate"
