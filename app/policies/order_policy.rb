class SupplierPolicy
  attr_reader :user, :supplier

  def initialize(user, supplier)
    @user = user
    @supplier = supplier
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