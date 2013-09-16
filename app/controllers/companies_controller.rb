class CompaniesController < ApplicationController
  before_filter :authenticate_user! #, only: [:new, :edit, :create, :update, :destroy]
  #before_filter only: [:edit, :update] {has_permission_to? 'manage_company'}

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find_by_slug(params[:id])

    respond_to do |format|
      format.html { redirect_to tenant_root_path(@company) }
      format.json { render json: @company }
    end
  end

  # GET /companies/new
  # GET /companies/new.json
  def new
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find_by_slug(params[:id])
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        ActsAsTenant.with_tenant(@company) do
          admin = Role.create(name: 'Administrator')
          admin.permissions << Permission.all
          admin.users << current_user

          developer = Role.create(name: 'Developer')
          developer.users << current_user

          Category.create([
              {name: t('category.name.techniques'), description: t('category.description.techniques')},
              {name: t('category.name.platforms'), description: t('category.description.platforms')},
              {name: t('category.name.tools'), description: t('category.description.tools')},
              {name: t('category.name.languages_and_frameworks'), description: t('category.description.languages_and_frameworks')}
            ])

          State.create([
              {name: t('implementation_state.name.trialing'), description: t('implementation_state.description.trialing')},
              {name: t('implementation_state.name.adopting'), description: t('implementation_state.description.adopting')},
              {name: t('implementation_state.name.in_production_use'), description: t('implementation_state.description.in_production_use')},
              {name: t('implementation_state.name.deprecated'), description: t('implementation_state.description.deprecated')}
            ])

          Recommendation.create([
              {name: t('recommendation_state.name.adopt'), description: t('recommendation_state.description.adopt')},
              {name: t('recommendation_state.name.trial'), description: t('recommendation_state.description.trial')},
              {name: t('recommendation_state.name.assess'), description: t('recommendation_state.description.assess')},
              {name: t('recommendation_state.name.hold'), description: t('recommendation_state.description.hold')}
            ])
        end

        format.html { redirect_to tenant_root_path(@company), notice: 'Company was successfully created.' }
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.json
  def update
    @company = Company.find_by_slug(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to tenant_root_path(@company), notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  #def destroy
  #  @company = Company.find(params[:id])
  #  @company.destroy
  #
  #  respond_to do |format|
  #    format.html { redirect_to companies_url }
  #    format.json { head :no_content }
  #  end
  #end

end
