class PledgegroupsController < ApplicationController
  def index
    @pledgegroups = Pledgegroup.all
  end

  def new
    @pledgegroup = Pledgegroup.new
  end

  
  def create
    @pledgegroup = Pledgegroup.new(pledgegroup_params)

    if @pledgegroup.save
      redirect_to pledgegroups_url
    else
      render :new, status: :unprocessable_entity
    end
  end




  # Get new pledgegroup parameters from form
  private
    def pledgegroup_params
      @user ||= get_curr_user

      par = params.require(:pledgegroup).permit(:budget)
      par[:admins] = [@user]

      # if checkbox checked, make is_public true
      if params[:is_public]
        par[:is_public] = true
      end

      par
    end

    # Get current User
    private
    def get_curr_user
      user ||= User.find_by(user_id: session[:user_id])
    end

end
