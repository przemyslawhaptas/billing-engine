namespace :authentication do
  task generate_token: :environment do
    result = Authentication::GenerateToken.new.call
    Logger.new(STDOUT).info(result)
  end
end
