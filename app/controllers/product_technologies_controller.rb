class ProductTechnologiesController < ApplicationController
  before_filter :authenticate_user! #, only: [:new, :edit, :create, :update, :destroy]

  # GET /product_technologies
  # GET /product_technologies.json
  def index
    @product_technologies = ProductTechnology.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_technologies }
    end
  end

  # GET /product_technologies/1
  # GET /product_technologies/1.json
  def show
    @product_technology = ProductTechnology.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_technology }
    end
  end

  # GET /product_technologies/new
  # GET /product_technologies/new.json
  def new
    @product_technology = ProductTechnology.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_technology }
    end
  end

  # GET /product_technologies/1/edit
  def edit
    @product_technology = ProductTechnology.find(params[:id])
  end

  # POST /product_technologies
  # POST /product_technologies.json
  def create
    @product_technology = ProductTechnology.new(params[:product_technology])
    @product_technology.product_id = params[:product_id] if params[:product_id]

    respond_to do |format|
      if @product_technology.save
        format.html { 
          flash[:success] = 'Product technology was successfully created.'
          if params[:product_id]
            redirect_to Product.find(params[:product_id])
          else
            redirect_to @product_technology 
          end
        }
        format.json { render json: @product_technology, status: :created, location: @product_technology }
      else
        format.html { render action: "new" }
        format.json { render json: @product_technology.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_technologies/1
  # PUT /product_technologies/1.json
  def update
    @product_technology = ProductTechnology.find(params[:id])

    respond_to do |format|
      if @product_technology.update_attributes(params[:product_technology])
        format.html { redirect_to @product_technology, notice: 'Product technology was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_technology.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_technologies/1
  # DELETE /product_technologies/1.json
  def destroy
    @product_technology = ProductTechnology.find(params[:id])
    @product_technology.destroy

    respond_to do |format|
      format.html { redirect_to product_technologies_url }
      format.json { head :no_content }
    end
  end
end
