class SettoriController < ApplicationController
  # GET /settori
  # GET /settori.json
  def index
    @settori = Settore.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @settori }
    end
  end

  # GET /settori/1
  # GET /settori/1.json
  def show
    @settore = Settore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @settore }
    end
  end

  # GET /settori/new
  # GET /settori/new.json
  def new
    @settore = Settore.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @settore }
    end
  end

  # GET /settori/1/edit
  def edit
    @settore = Settore.find(params[:id])
  end

  # POST /settori
  # POST /settori.json
  def create
    @settore = Settore.new(params[:settore])

    respond_to do |format|
      if @settore.save
        format.html { redirect_to @settore, notice: 'Settore was successfully created.' }
        format.json { render json: @settore, status: :created, location: @settore }
      else
        format.html { render action: "new" }
        format.json { render json: @settore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /settori/1
  # PUT /settori/1.json
  def update
    @settore = Settore.find(params[:id])

    respond_to do |format|
      if @settore.update_attributes(params[:settore])
        format.html { redirect_to @settore, notice: 'Settore was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @settore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /settori/1
  # DELETE /settori/1.json
  def destroy
    @settore = Settore.find(params[:id])
    @settore.destroy

    respond_to do |format|
      format.html { redirect_to settori_url }
      format.json { head :ok }
    end
  end
end
