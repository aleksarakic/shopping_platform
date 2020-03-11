class BuyerPolicy
  attr_reader :user, :buyer

  def initialize(user, buyer)
    @user = user
    @buyer = buyer
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