class BuyerPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def show?
    user.accountable_type == 'Buyer'
  end
end