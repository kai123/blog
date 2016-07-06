class Category < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: :history

	validates :name, presence: true
	validates :description, presence: true

	has_many :posts
end
