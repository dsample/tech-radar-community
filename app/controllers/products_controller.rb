class ProductsController < ApplicationController
  before_filter :authenticate_user! #, only: [:new, :edit, :create, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id], :include => :product_technologies)
    @product_technology = ProductTechnology.new product_id: @product.id #@product.product_technologies.new

    @commentable = @product
    @comments = @commentable.comments
    @comment = Comment.new

    @technologies = Technology.all # @product.unused_technologies

    @states = State.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        flash[:success] = 'Product was successfully created.'
        format.html { redirect_to @product }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        flash[:success] = 'Product was successfully updated.'
        format.html { redirect_to @product }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    product_name = @product.name
    @product.destroy

    respond_to do |format|
      if @product.destroy
        flash[:error] = "#{product_name} deleted"
        format.html { redirect_to products_url }
        format.json { head :no_content }
      else
        flash[:error] = 'Product has connections or recommendations. Remove these before deletion'
        format.html { redirect_to @product }
        format.json { render json: @product.errors }
      end
    end
  end
end
