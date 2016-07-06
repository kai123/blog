class Admin::CategoriesController < AdminController
	before_action :set_category, except: [:index, :create, :new]

	def index
		@categories = Category.order("name asc")
	end

	def new
		@category = Category.new
	end

	def edit
	end

	def show
	end

	def destroy
		if @category.destroy
			redirect_to admin_categories_url, notice: 'Kategorie gelöscht.'
		else
			redirect_to admin_category_url(@category), alert: 'Ups, das hätte nicht passieren sollen!'
		end
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to admin_categories_url, notice: 'Kategorie erstellt.'
		else
			render action: 'new'
		end
	end

	def update
		if @category.update(category_params)
			redirect_to admin_categories_url, notice: 'Kategorie bearbeitet.'
		else
			render action: 'edit'
		end
	end


	private
		def set_category
			@category = Category.friendly.find(params[:id])
		end

		def category_params
			params.require(:category).permit(:name, :description)
		end
end
