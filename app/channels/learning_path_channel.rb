class LearningPathChannel < ApplicationCable::Channel
  def subscribed
    learning_path = LearningPath.find(params[:id])
    stream_for current_user
  end

  def unsubscribed
    stop_all_streams
  end
end
