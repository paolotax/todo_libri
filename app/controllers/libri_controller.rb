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
    @libro = Libro.new(params[:libro])
    respond_to do |format|
      if @libro.save
        format.html { redirect_to @libro, notice: 'Libro was successfully created.' }
        format.json { render json: @libro, status: :created, location: @libro }
      else
        format.html { render action: "new" }
        format.json { render json: @libro.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @libro = Libro.find(params[:id])

    respond_to do |format|
      if @libro.update_attributes(params[:libro])
        format.html { redirect_to @libro, notice: 'Libro was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @libro.errors, status: :unprocessable_entity }
      end
    end
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