class ApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_opportunity
  before_action :require_volunteer_role, only: [:new, :create]

  def new
    # Check if the volunteer has already applied for the opportunity
    existing_application = @opportunity.applications.find_by(user_id: current_user.id)
    if existing_application
      redirect_to @opportunity, alert: "You have already applied to this opportunity."
    else
      @application = @opportunity.applications.build
    end
  end

  
  
  

  def create
    # Check if the volunteer has already applied for the opportunity
    existing_application = @opportunity.applications.find_by(user_id: current_user.id)
    
    if existing_application
      redirect_to @opportunity, alert: "You have already applied to this opportunity."
    else
      @application = @opportunity.applications.build(application_params)
      @application.user_id = current_user.id  # Associate the current user (volunteer) with the application
      @application.status = :applied   # Set the status to applied
    org_user = @opportunity.user  # assuming organization belongs_to user
      Notification.create(
        user: org_user,
        title: "New Volunteer Application",
        body: "#{current_user.id} applied for #{@opportunity.title}."
      )
      if @application.save
        redirect_to @opportunity, notice: "Application submitted!"
      else
        render :new, status: :unprocessable_entity
      end
    end
  end
  

  def edit
    @application = @opportunity.applications.find(params[:id])
    redirect_to root_path, alert: "You are not authorized to edit the application status." unless current_user.role == "organization"
  end
def update
  @application = @opportunity.applications.find(params[:id])

  if current_user.role == "organization" && @application.update(status: params[:application][:status])
    
    # ✅ SEND NOTIFICATION TO VOLUNTEER WHEN ACCEPTED
    if @application.status == "accepted"
      Notification.create(
        user: @application.user,
        title: "Application Accepted",
        body: "Good news! Your application for #{@opportunity.title} has been accepted."
      )
    end

    redirect_to @opportunity, notice: "Application status updated."
  else
    render :edit, status: :unprocessable_entity
  end
end


  private

  def application_params
    # Permit only the necessary fields
    params.require(:application).permit(:opportunity_id)
  end

  def set_opportunity
    @opportunity = Opportunity.find(params[:opportunity_id])
  end

  def require_volunteer_role
    redirect_to root_path, alert: "Only volunteers can apply." unless current_user.role == "volunteer"
  end
end
