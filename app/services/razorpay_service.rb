require 'razorpay'
class RazorpayService
  def initialize()
    Razorpay.setup(ENV['KEY_ID'], ENV['KEY_SECRET'])
  end
end