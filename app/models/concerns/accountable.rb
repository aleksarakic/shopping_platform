module Accountable
  extend ActiveSupport::Concern

  included do
    has_many :users, :as => :accountable
  end
end