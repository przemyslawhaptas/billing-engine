namespace :scheduled do
  task billing: :environment do
    result = SchedulerRunsBilling.new.call(DateTime.now)
    Logger.new(STDOUT).info(result)
  end
end
