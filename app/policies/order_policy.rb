class OrderPolicy
  attr_reader :user, :order

  def initialize(user, order)
    @user = user
    @order = order
  end

  def index?
    user.accountable_type == 'Buyer'
  end

  def show?
    user.accountable_type == 'Buyer'
  end

  def new?
    user.accountable_type == 'Buyer' 
  end

  def create?
    user.accountable_type == 'Buyer'
  end
end