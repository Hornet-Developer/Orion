class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :campaign_planner_path


  def campaign_planner_path
    if current_user.company_type == 'Advertiser'
       new_advertiser_campaign_path(advertiser_id: current_user.company.id)
    else
      agency = Agency.find(current_user.company.id)
      advertiser = agency.advertisers.first
      advertiser ? new_advertiser_campaign_path(advertiser.id) : ''
    end
  end

  private

  def layout_by_resource
    if devise_controller? && controller_name != 'invitations'
      'devise'
    else
      if controller_name == 'invitations' && action_name == 'edit'
        'devise'
      else
        'application'
      end
    end
  end

  def after_sign_in_path_for(resource)
    is_admin = resource.class == Admin
    invite_awaits = resource.class == User && resource.invitation_token.nil?

    if is_admin
      rails_admin_path
    elsif invite_awaits
      root_path
    elsif !invite_awaits
      accept_user_invitation_path
    end
  end
end
