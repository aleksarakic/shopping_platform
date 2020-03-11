class CartPolicy
  attr_reader :user, :cart

  def initialize(user, cart)
    @user = user
    @cart = cart
  end

  def show?
    user.accountable_type == 'Buyer'
  end

  def destroy?
    user.accountable_type == 'Buyer'
  end
end