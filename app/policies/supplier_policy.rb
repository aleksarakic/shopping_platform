class SupplierPolicy
  attr_reader :user, :supplier

  def initialize(user, supplier)
    @user = user
    @supplier = supplier
  end

  def shop?
  	# besides buyers, shop can be seen just by it's own supplier
  	user.accountable_type == 'Buyer' || user.accountable_id == @supplier.id
  end

  def show?
  	# besides buyers, shop can be seen just by it's own supplier
    user.accountable_type == 'Buyer' || user.accountable_id == @supplier.id
  end
end