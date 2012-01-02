class LibriController < ApplicationController

  respond_to :html, :js, :json 
  
  def index
    @libri = Libro.order("id")
    respond_with @libri
  end


  def show
    @libro = Libro.find(params[:id])
  end

  def new
    @libro = Libro.new
  end

  def edit
    @libro = Libro.find(params[:id])
  end

  def create
    @libro = Libro.new(params.except(:controller, :action))
    @libro.save
  end

  def update
    #raise params[:libro].inspect
    
    @libro = Libro.find(params[:id])
    @libro.update_attributes(params.except(:controller, :action))
    respond_with @libro
  end

  def destroy
    @libro = Libro.find(params[:id])
    @libro.destroy

    respond_to do |format|
      format.html { redirect_to libri_url }
      format.json { head :ok }
    end
  end
end
