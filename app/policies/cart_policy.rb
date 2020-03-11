class CartPolicy
  attr_reader :user, :supplier

  def initialize(user, supplier)
    @user = user
    @supplier = supplier
  end

  def show?
    user.accountable_type == 'Buyer'
  end

  def destroy?
    user.accountable_type == 'Buyer'
  end
end