class ApplicationController < ActionController::API
  include ActionController::Cookies
  
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity


#define 2 method of current user and autherized user
#will have a b4 action, autherized user
#skip before action when user is already logged in when create

 before_action :authorized_user
 



  def current_user
    User.find_by(id: session[:user_id])
  end

  def authorized_user
    render json: {errors: ["Please login"]}, status: :unauthorized unless current_user
  end
  

  private

  def record_not_found err
    render json: {error: [err.message]}, status: :not_found
  end

  def render_unprocessable_entity invalid
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end

end
