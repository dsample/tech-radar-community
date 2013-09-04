class RecommendsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]
  before_filter :load_recommendable

  # GET /recommends
  # GET /recommends.json
  def index
    @recommends = @recommendable.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recommends }
    end
  end

  # GET /recommends/new
  # GET /recommends/new.json
  def new
    @recommend = @recommendable.recommends.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recommend }
    end
  end

  # POST /recommends
  # POST /recommends.json
  def create
    @recommend = @recommendable.recommends.new(params[:recommend])
    @recommend.user = current_user
    
    respond_to do |format|
      if @recommend.save
        flash[:success] = 'Recommendation created.'
        format.html { redirect_to @recommendable }
        format.json { render json: @recommend, status: :created, location: @recommend }
      else
        format.html { render action: "new" }
        format.json { render json: @recommend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recommends/1
  # PUT /recommends/1.json
  #def update
  #  @recommend = Recommend.find(params[:id])
  #
  #  respond_to do |format|
  #    if @recommend.update_attributes(params[:recommend])
  #      format.html { redirect_to @recommend, notice: 'Recommend was successfully updated.' }
  #      format.json { head :no_content }
  #    else
  #      format.html { render action: "edit" }
  #      format.json { render json: @recommend.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /recommends/1
  # DELETE /recommends/1.json
  #def destroy
  #  @recommend = Recommend.find(params[:id])
  #  @recommend.destroy
  #
  #  respond_to do |format|
  #    format.html { redirect_to recommends_url }
  #    format.json { head :no_content }
  #  end
  #end

  private

  def load_recommendable
    resource, id = request.path.split('/')[1, 2]
    @recommendable = resource.singularize.classify.constantize.find(id)
  end
end
