class StartupsController < ApplicationController
  inherit_resources

  belongs_to :user, :optional => true

  has_scope :page, :default => 1

  before_filter :hide_sidebar, :only => [:show, :edit]
  after_filter  :attach_founder_to_startup, :only => :create

  def profile_details
    render :partial => 'startups/profile_details', :locals => { :startup => resource }
  end

  def profile_team
    render :partial => 'startups/profile_team', :locals => { :startup => resource }
  end

  def photos
    render :partial => 'startups/photos', :locals => { :startup => resource }
  end

  def upload_photos

  end

  def attach_user
    if request.post?
      result = resource.invite_or_attach_user(params[:role_identifier], params[:attributes])

      respond_to do |format|
        format.json { render :json => result }
        format.html { redirect_to resource_path(resource) }
      end
    end
  end

  def update_user
    user = User.find(params[:uid])

    if request.post?
      result = resource.update_user(user, params[:role_identifier], params[:attributes])

      respond_to do |format|
        format.json { render :json => result }
        format.html { redirect_to resource_path(resource) }
      end
    else
      @user_meta = resource.user_meta(user)
    end
  end

  def detach_user
    if request.post?
      result = resource.detach_user(User.find(params[:uid]), params[:role_identifier])

      respond_to do |format|
        format.json { render :json => result }
        format.html { redirect_to resource_path(resource) }
      end
    end
  end

  private

  def attach_founder_to_startup
    if resource.persisted?
      resource.attach_user(parent, :member, t('label.founder'))
      resource.confirm_user(parent)
    end
  end

  def startup_params
    params.require(:startup).permit(:name,
                      :pitch,
                      :funds_to_raise,
                      :stage_identifier,
                      :market_identifier,
                      :location,
                      :description)
  end
end
