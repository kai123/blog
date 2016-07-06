class Post < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :history

	validates :author, presence: true
	validates :title, presence: true
	validates :text, presence: true
	validates :category_id, presence: true
	validates :adminuser_id, presence: true

	belongs_to :category
	belongs_to :adminuser


	def self.search(params)	
		return self if params.blank? && params[:search].blank? && params[:author][:adminuser_id].blank?
		result = self

		unless params[:search].blank?
			puts "#{params[:search]} | #{params[:adminuser_id]}"
			result = result.where("posts.text LIKE :search OR posts.author LIKE :search OR posts.title LIKE :search OR posts.subtitle LIKE :search", search: "%#{params[:search]}%")
		end

		unless params[:author].blank?
			result = result.where("posts.adminuser_id LIKE :search", search: "#{params[:author][:adminuser_id]}")
		end

		result
	end

end
