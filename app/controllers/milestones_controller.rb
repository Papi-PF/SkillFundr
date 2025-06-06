class MilestonesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_learning_path
  before_action :set_milestone, only: [:update]

  # GET /milestones/1
  def show
  end

  # PATCH /milestones/1
  def update
    if @milestone.update(milestone_params)
      current_user.update_funding_eligibility! if @milestone.completed?
      respond_to do |format|
      format.html { redirect_to learning_path_path(@learning_path) }
      format.json {
        render json: {
          status: 'success',
          completion_percentage: @learning_path.completion_percentage,
          completed_count: @learning_path.completed_milestones_count,
          total_milestones: @learning_path.milestones.count,
          funding_eligible: current_user.funding_eligibility?
        }
      }
    end
    else
      respond_to do |format|
        format.json {
          render json: { status: 'error' },
          status: :unprocessable_entity
        }
      end
    end
  end

  def mark_complete
    if @milestone.nil?
      flash[:alert] = "Milestone not found."
      redirect_to root_path
      return
    end

    if @milestone.update(milestone_params)
      redirect_to learning_path_path(@learning_path), notice: "Milestone completed!"
    else
      redirect_to :back, alert: "Failed to complete milestone."
    end
  end

 private

  def set_learning_path
    @learning_path = LearningPath.find_by(id: params[:learning_path_id])

    unless @learning_path
      respond_to do |format|
        format.json {
          render json: { status: 'error', message: 'Learning path not found' },
          status: :not_found
        }
      end
    end
  end

  def set_milestone
    @milestone = @learning_path.milestones.find_by(id: params[:id])

    unless @milestone
      respond_to do |format|
        format.json {
          render json: { status: 'error', message: 'Milestone not found' },
          status: :not_found
        }
      end
    end
  end

  def milestone_params
    params.require(:milestone).permit(:completed)
  end
end
