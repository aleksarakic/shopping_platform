class BuyerPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def show?
    # allow only other Buyers to see each other's profiles 
    user.accountable_type == 'Buyer'
  end

  def new?
    # allow non logged in users to create new buyer
		user.nil?
  end

  def create?
    # allow non logged in users to create new buyer
  	user.nil?
  end
end