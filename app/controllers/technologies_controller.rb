class TechnologiesController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  # GET /technologies
  # GET /technologies.json
  def index
    @technologies = Technology.all(:conditions => 'deleted_at IS NULL')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @technologies }
    end
  end

  # GET /technologies/1
  # GET /technologies/1.json
  def show
    @technology = Technology.find(params[:id], :include => :product_technologies)
    if @technology.product_technologies.count > 0
      @products_using_this = @technology.products_using_this
      @products_not_using_this = @technology.products_not_using_this
      #@products_using_this = @technology.product_technologies
      #@products_not_using_this = Product.where('id not in (?)', @technology.product_technologies.map(&:product_id).join(','))
    else
      @products_using_this = [] # use 'none' in Rails 4
      @products_not_using_this = Product.find(:all)
    end
    
    @commentable = @technology
    @comments = @commentable.comments
    @comment = Comment.new

    @recommendable = @technology
    @recommends = @recommendable.recommends
    @recommend = Recommend.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @technology }
    end
  end

  # GET /technologies/new
  # GET /technologies/new.json
  def new
    @technology = Technology.new
    @categories = Category.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @technology }
    end
  end

  # GET /technologies/1/edit
  def edit
    @technology = Technology.find(params[:id])
    @categories = Category.find(:all)

    if @technology.deleted?
      respond_to do |format|
        flash[:error] = 'Technology is marked as deleted, so cannot be modified'
        format.html { redirect_to @technology }
        format.json { render nothing: true, status: :method_not_allowed }
      end
    end
  end

  # POST /technologies
  # POST /technologies.json
  def create
    @technology = Technology.new(params[:technology])

    respond_to do |format|
      if @technology.save
        flash[:success] = 'Technology was successfully created.'
        format.html { redirect_to @technology }
        format.json { render json: @technology, status: :created, location: @technology }
      else
        format.html { render action: "new" }
        format.json { render json: @technology.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /technologies/1
  # PUT /technologies/1.json
  def update
    @technology = Technology.find(params[:id])

    respond_to do |format|

      if @technology.active?
        if @technology.update_attributes(params[:technology])
          flash[:success] = 'Technology was successfully updated.'
          format.html { redirect_to @technology }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @technology.errors, status: :unprocessable_entity }
        end
      else
        flash[:error] = 'Technology is marked as deleted, so cannot be modified'
        format.html { redirect_to @technology }
        format.json { render json: @technology.errors, status: :method_not_allowed }
      end
    end
  end

  # DELETE /technologies/1
  # DELETE /technologies/1.json
  def destroy
    @technology = Technology.find(params[:id])
    technology_name = @technology.name

    if @technology.active?
      @technology.deleted_at = DateTime.now

      respond_to do |format|
        #if @technology.destroy
        if (@technology.orphan?)
          success = @technology.destroy
        else
          success = @technology.save
        end
        if success
          flash[:notice] = "#{technology_name} deleted"
          format.html { redirect_to technologies_url }
          format.json { head :no_content }
        else
          flash[:error] = 'Technology has product connections or recommendations'
          format.html { redirect_to @technology }
          format.json { render json: @technology.errors }
        end
      end
    else
      respond_to do |format|
        flash[:error] = 'Technology has already been marked as deleted'
        format.html { redirect_to @technology }
        format.json { render json: @technology.errors, status: :method_not_allowed }
      end
    end
  end

end
