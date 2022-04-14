class PledgegroupsController < ApplicationController
  def index
    @pledgegroups = Pledgegroup.all
  end

  def new
    @pledgegroup = Pledgegroup.new
  end

  def create
    @pledgegroup = Pledgegroup.new({ budget: params[:pledgegroup][:budget], admins: [current_user], is_public: (params[:is_public] ? true : false)})

    if @pledgegroup.save
      redirect_to pledgegroups_url
    else
      flash[:error] = "Pledge group could not be saved with the given input"
      redirect_back fallback_location: new_pledgegroup_path
    end
  end



  def edit
    @pledgegroup = Pledgegroup.find(params[:id])
  end

  def update
    @pledgegroup = Pledgegroup.find(params[:id])

    if @pledgegroup.update({ budget: params[:pledgegroup][:budget], admins: [current_user], is_public: (params[:is_public] ? true : false)})
      redirect_to pledgegroups_url
    else
      flash[:error] = "Pledge group could not be saved with the given input"
      redirect_back fallback_location: edit_pledgegroup_path
    end
  end
end
