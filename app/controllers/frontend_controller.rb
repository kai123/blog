class Frontend::PagesController < FrontendController
  def index
    @categories = Category.all.order("lower(name)")
    @courses = Course.top_courses.order("lower(title)")
    @news = News.published.order("published_date desc").limit(6)
  end

  def courses
  end

  def news
  end

  def faq
  end

  def contact
    @contactform = Contactform.new
  end

  def send_email
    @contactform = Contactform.new(contact_params)
    if @contactform.save
      return redirect_to thanks_url
    else
      render "contact"
    end
  end

  def imprint
  end

  def datenschutz
  end

  def englisch
  end

  def thanks
  end

  def glossary
    @glossary = Content.where(name: "Glossar").first
  end

  def supplier
    @supplier = Content.where(name: "Anbieter-Profile").first
  end

  def about
    @about = Content.where(name: "Über").first
    @course1 = Course.find_by(import_id: 1960)
    @course2 = Course.find_by(import_id: 1722)
    @course3 = Course.find_by(import_id: 1619)
    @course4 = Course.find_by(import_id: 2238)
  end

  def for_supplier
    @for_supplier = Content.where(name: "Für Anbieter").first
  end

  def error_404
    render "error_404.html", status: 404
  end

  def error_406
    render "error_406.html", status: 406
  end

  def error_422
    render "error_422.html", status: 422
  end

  def sitemap
    respond_to :text
  end

  def robots
    respond_to :text
  end


  private
    def contact_params
      params.require(:contactform).permit(:name1, :name2, :email, :message, :newsletter)
    end
end
