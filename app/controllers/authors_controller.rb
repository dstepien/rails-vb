class AuthorsController < ApplicationController
  def index
    @authors = Author.order(:name).paginate(page: params[:page], per_page: 10)
    @page_title = t('titles.authors.index')
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
    @page_title = t('titles.authors.new')
  end

  def edit
    @author = Author.find(params[:id])
    @page_title = @author.name
  end

  def create
    @author = Author.new(params[:author])

    respond_to do |format|
      if @author.save
        format.js { render json: @author }
        format.html { redirect_to @author, notice: 'Author was successfully created.' }
      else
        format.js { render json: { errors: @author.errors } }
        format.html { render action: "new" }
      end
    end
  end

  def update
    @author = Author.find(params[:id])

    if @author.update_attributes(params[:author])
      redirect_to @author, notice: 'Author was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    redirect_to authors_url
  end
end
