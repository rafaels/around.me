class GcmRegistrationsController < ApplicationController
  def create
    user = User.where(:authentication_token => params[:registration][:token]).first
    user.reg_id = params[:registration][:reg_id]

    respond_to do |format|
      if user.save
        format.json { render json: user, status: :created, location: user }
      else
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
  end
end
