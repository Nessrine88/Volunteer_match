class OpportunitiesController < ApplicationController
  before_action :set_opportunity, only: %i[ show edit update destroy ]
  before_action :authenticate_user! 

  def index
    @opportunities = Opportunity.all
  end
 
  def index_for_organization
    if current_user
      logger.debug "Current User ID: #{current_user.id}"
      @opportunities = current_user.opportunities.order(created_at: :desc)
      logger.debug "Opportunities found: #{@opportunities.count}"
      logger.debug "Opportunity IDs: #{@opportunities.pluck(:id)}"
    else
      redirect_to root_path, alert: "You are not authorized to view this page."
    end
  end

  # GET /opportunities/1 or /opportunities/1.json
  def show
    @applied_users = @opportunity.applications.includes(:user).map(&:user)
  end

  def search
    @opportunities = Opportunity.where("title ILIKE ?", "%#{params[:query]}%")
    render :index
  end

  # GET /opportunities/new
  def new
    @opportunity = Opportunity.new
  end

  # GET /opportunities/1/edit
  def edit
  end

  # POST /opportunities or /opportunities.json
  def create
    @opportunity = Opportunity.new(opportunity_params)
    @opportunity.user_id = current_user.id
    respond_to do |format|
      if @opportunity.save
        format.html { redirect_to @opportunity}
        format.json { render :show, status: :created, location: @opportunity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opportunities/1 or /opportunities/1.json
  def update
    respond_to do |format|
      if @opportunity.update(opportunity_params)
        format.html { redirect_to @opportunity, notice: "Opportunity was successfully updated." }
        format.json { render :show, status: :ok, location: @opportunity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opportunities/1 or /opportunities/1.json
  def destroy
    @opportunity.destroy!

    respond_to do |format|
      format.html { redirect_to opportunities_path, status: :see_other, notice: "Opportunity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_opportunity
      @opportunity = Opportunity.find(params[:id])
    end

    def applications
      @opportunity = Opportunity.find(params[:id])
      @applications = @opportunity.applications.includes(:user)
    end
    
    def opportunity_params
      params.require(:opportunity).permit(:title, :description, :skills_required, :location, :start_date, :end_date)
    end
end
