class Admin::PostsController < AdminController
	before_action :set_post, except: [:index, :create, :new]
	
	def index
		@posts = Post.search(params).order("created_at desc")
		@authors = Adminuser.all.order("name asc")
	end

	def new
		@post = Post.new
		set_adminuser
	end

	def edit
	end

	def show
	end

	def destroy
		if @post.destroy
			redirect_to admin_posts_url, notice: 'Post gelöscht.'
		else
			redirect_to admin_post_url(@post), alert: 'Ups, das hätte nicht passieren sollen!'
		end
	end

	def create
		@post = Post.new(post_params)
		set_adminuser
		if @post.save
			redirect_to admin_posts_url, notice: 'Post erstellt.'
		else
			render action: 'new'
		end
	end

	def update
		set_adminuser
		if @post.update(post_params)
			redirect_to admin_posts_url, notice: 'Post bearbeitet.'
		else
			render action: 'edit'
		end
	end


	private
		def set_post
			@post = Post.friendly.find(params[:id])
		end

		def set_adminuser
			@post.adminuser = current_adminuser
			@post.author = current_adminuser.name
		end

		def post_params
			params.require(:post).permit(:sources, :search, :adminuser_id, :category_id, :published, :title, :text, :author, :subtitle, :image, :remove_image)
		end
end
