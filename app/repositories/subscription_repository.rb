class SubscriptionRepository
  def where_billing_day(today)
    creation_days = map_billing_day_to_creation_days(today.day)

    Subscription
      .where.not("created_at::date = ?", today)
      .where("date_part('day', created_at) in (?)", creation_days)
  end

  def with_billing(subscriptions)
    subscriptions.includes(customer: [:billing])
  end

  private

  # because of the differences in month length, all subscriptions with billing date
  # later than the 28th day of the month should be billed on the 28th day of the month
  def map_billing_day_to_creation_days(billing_day)
    if billing_day > 28
      []
    elsif billing_day == 28
      [28, 29, 30, 31]
    else
      [billing_day]
    end
  end
end
