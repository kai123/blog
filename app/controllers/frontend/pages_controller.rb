class Frontend::PagesController < FrontendController
  def index  

  end

  def categories
    render :categories
  end

  def show

  end

  def imprint

  end
  
  def about
    render "about"
  end

  def error_404

  end
  
  private
    def frontend_params
      params.require(:frontend).permit(:post_id, :category_id, :adminuser_id)
    end
end
