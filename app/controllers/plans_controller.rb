class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

private

  def plan_params
    params.require(:plan).permit(:name, :price, :plan_type)
  end
end