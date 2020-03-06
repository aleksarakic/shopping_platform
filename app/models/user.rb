class User < ApplicationRecord
	belongs_to :accountable, :polymorphic => true
end
