class SchedulerRunsBilling
  def initialize(
    subscription_repository: SubscriptionRepository.new,
    product_repository: ProductRepository.new,
    purchase_service: Fakeway::FollowingPurchase.new
  )
    @subscription_repository = subscription_repository
    @product_repository = product_repository
    @purchase_service = purchase_service
  end

  def call(today)
    subscriptions = subscription_repository.with_billing(
      subscription_repository.where_billing_day(today)
    )

    subscriptions.map do |subscription|
      amount = product_repository.find_price(subscription.product_id)

      purchase_service.call(amount, subscription.customer.billing)
    end
  end

  private

  attr_reader :subscription_repository, :product_repository, :purchase_service
end
