require 'razorpay'
class RazorpayService
  def initialize()
    Razorpay.setup(ENV['KEY_ID'], ENV['KEY_SECRET'])
  end

  def find_or_create_customer(customer)
    if customer.razorpay_customer_id.present?
      razorpay_customer = Razorpay::Customer.retrieve(customer.razorpay_customer_id)
    else
      razorpay_customer = Razorpay::Customer.create(customer_params)
      customer.update(razorpay_customer_id: razorpay_customer_id)
    end
    razorpay_customer
  end
end