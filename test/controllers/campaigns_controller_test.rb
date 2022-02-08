require 'test_helper'

class CampaignsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers


  # INDEX

  test 'index should redirect when user is not logged in' do
    get "/vendors/#{advertisers(:first).id}/campaigns"

    assert_response :redirect
  end

  test 'index should redirect when user does not have access to advertiser' do
    sign_in users(:no_access_user)

    get "/vendors/#{advertisers(:first).id}/campaigns"

    assert_response :redirect
  end

  test 'should get index when user has access to advertiser' do
    sign_in users(:advertiser_user)

    get "/vendors/#{advertisers(:first).id}/campaigns"

    assert_response :success
    assert_equal assigns(:advertiser), advertisers(:first)
    assert_equal assigns(:campaigns), advertisers(:first).campaigns
  end

  test 'should get index when user has access to agency' do
    sign_in users(:agency_user)

    get "/vendors/#{advertisers(:first).id}/campaigns"

    assert_response :success
    assert_equal assigns(:advertiser), advertisers(:first)
    assert_equal assigns(:campaigns), advertisers(:first).campaigns
  end

  # SHOW

  test 'should get show when user has access to advertiser' do
    sign_in users(:advertiser_user)

    get "/campaigns/#{campaigns(:first).id}"

    assert_response :success
    assert_equal assigns(:campaign), campaigns(:first)
    assert_equal assigns(:website), 'www.website.com'
    assert_equal assigns(:button_links),
                 {
                   back: vendor_campaigns_path(vendor_id: advertisers(:first).id),
                   edit: "/campaigns/#{campaigns(:first).id}/edit",
                   duplicate: "/campaigns/#{campaigns(:first).id}/duplicate",
                   delete: "/campaigns/#{campaigns(:first).id}"
                 }
  end

  test 'should redirect when user does not have access to advertiser' do
    sign_in users(:no_access_user)

    get "/campaigns/#{campaigns(:first).id}"

    assert_redirected_to root_path
  end

  # NEW

  test 'new should redirect if user is not logged in' do
    get "/vendors/#{advertisers(:first).id}/campaigns/new"

    assert_response :redirect
  end

  test 'new should redirect if user does not have access to advertiser' do
    sign_in users(:no_access_user)

    get "/vendors/#{advertisers(:first).id}/campaigns/new"

    assert_response :redirect
  end

  test 'should get new when user has access to advertiser' do
    sign_in users(:advertiser_user)

    get "/vendors/#{advertisers(:first).id}/campaigns/new"

    assert_response :success
    assert_equal assigns(:advertiser), advertisers(:first)
    assert_equal assigns(:campaign).advertiser_id, advertisers(:first).id
    assert_not assigns(:campaign).persisted?
  end

  test 'should get new when user has access to agency' do
    sign_in users(:agency_user)

    get "/vendors/#{advertisers(:first).id}/campaigns/new"

    assert_response :success
    assert_equal assigns(:advertiser), advertisers(:first)
    assert_equal assigns(:campaign).advertiser_id, advertisers(:first).id
    assert_not assigns(:campaign).persisted?
  end

  test 'should get new without specifying vendor' do
    sign_in users(:agency_user)

    get "/campaigns/new"

    assert_response :success
    assert_nil assigns(:advertiser)
    assert_nil assigns(:campaign).advertiser_id
    assert_not assigns(:campaign).persisted?
  end

  # DUPLICATE

  test 'duplicate should redirect if user is not logged in' do
    get "/campaigns/#{campaigns(:first).id}/duplicate"

    assert_response :redirect
  end

  test 'duplicate should redirect if user is logged in as no access user' do
    sign_in users(:no_access_user)
    get "/campaigns/#{campaigns(:first).id}/duplicate"

    assert_response :redirect
  end

  test 'duplicate should render new if user is logged in as advertiser' do
    sign_in users(:advertiser_user)
    get "/campaigns/#{campaigns(:first).id}/duplicate"

    assert_template :new
  end

  test 'duplicate should render new if user is logged in as agency' do
    sign_in users(:agency_user)
    get "/campaigns/#{campaigns(:first).id}/duplicate"

    assert_template :new
  end


  # CREATE

  test 'redirects if user is not logged in' do
    assert_no_changes('Campaign.count') do
      post "/campaigns", params: create_params
    end

    assert_response :redirect
  end

  test 'redirects if user does not have access to advertiser' do
    sign_in users(:no_access_user)

    assert_no_changes('Campaign.count') do
      post "/campaigns", params: create_params
    end

    assert_response :redirect
  end

  test 'should create campaign if user has access to advertiser' do
    sign_in users(:advertiser_user)

    assert_difference('Campaign.count') do
      assert_emails 2 do
        post "/campaigns", params: create_params
      end
    end

    assert_response :success
    assert_equal true, assigns(:campaign).persisted?
  end

  test 'should create campaign with advertiser_id in url rather than in params' do
    sign_in users(:advertiser_user)

    create_params[:campaign].delete(:advertiser_id)

    assert_difference('Campaign.count') do
      assert_emails 2 do
        post "/vendors/#{advertisers(:first).id}/campaigns", params: create_params
      end
    end

    assert_response :success
    assert_equal true, assigns(:campaign).persisted?
    assert_equal "pending", assigns(:campaign).status
  end

  # TODO: We probably don't want to leave it like this?
  test 'if validation fails returns 200 OK, with error in the body' do
    sign_in users(:advertiser_user)

    assert_no_changes('Campaign.count') do
      post "/campaigns", params: { campaign: { name: nil } }
    end

    assert_response :success
    assert_equal JSON.parse(response.body),
                 {
                   "messages" => { "name" => "can't be blank", "campaign_url" => "URL is not valid" },
                   "redirectTo" => '',
                   "status" => 422
                 } 
  end

  # EDIT

  test 'edit should redirect if user is not logged in' do
    get "/campaigns/#{campaigns(:first).id}/edit"

    assert_response :redirect
  end

  test 'edit should redirect if user does not have access to campaign' do
    sign_in users(:no_access_user)

    get "/campaigns/#{campaigns(:first).id}/edit"

    assert_response :redirect
  end

  test 'should get edit when user has access to campaign' do
    sign_in users(:advertiser_user)

    get "/campaigns/#{campaigns(:first).id}/edit"

    assert_response :success
    assert_equal assigns(:campaign), campaigns(:first)
  end

  # UPDATE

  test 'update should redirect when user is not logged in' do
    patch "/campaigns/#{campaigns(:first).id}",
          params: { campaign: { name: 'Updated Campaign Name' } }

    assert_response :redirect
  end

  test 'update should redirect when user does not have access to campaign' do
    sign_in users(:no_access_user)

    patch "/campaigns/#{campaigns(:first).id}",
          params: { campaign: { name: 'Updated Campaign Name' } }

    assert_response :redirect
  end

  test 'should update campaign' do
    sign_in users(:advertiser_user)

    patch "/campaigns/#{campaigns(:first).id}",
          params: { campaign: { name: 'Updated Campaign Name' } }
    
    assert_response :success
    assert_equal assigns(:campaign), campaigns(:first)
    assert_equal campaigns(:first).reload.name, 'Updated Campaign Name'
  end

  test 'update should render errors if update fails' do
    sign_in users(:advertiser_user)

    put "/campaigns/#{campaigns(:first).id}",
    params: { campaign: { name: nil } }

    assert_response :unprocessable_entity

    assert_equal assigns(:campaign), campaigns(:first)
    assert_equal campaigns(:first).reload.name, 'First Campaign'    
    assert_equal(JSON.parse(response.body), { "name" => ["can't be blank"] })
  end

  test 'update should redirect on last step' do
    sign_in users(:advertiser_user)

    patch "/campaigns/#{campaigns(:first).id}?step=4",
          params: { campaign: { name: 'Updated Campaign Name' } }
    
    assert_redirected_to vendor_campaigns_path(vendor_id: campaigns(:first).advertiser_id)
    assert_equal assigns(:campaign), campaigns(:first)
    assert_equal campaigns(:first).reload.name, 'Updated Campaign Name'
  end

  # DESTROY

  test 'destroy should redirect if user is not logged in' do
    assert_no_changes('Campaign.count') do
      delete "/campaigns/#{campaigns(:first).id}"
    end

    assert_response :redirect
  end

  test 'destroy should redirect if user does not have access to the campaign' do
    sign_in users(:no_access_user)

    assert_no_changes('Campaign.count') do
      delete "/campaigns/#{campaigns(:first).id}"
    end

    assert_response :redirect
  end

  test 'should destroy a campaign when user has access to the campaign' do
    sign_in users(:advertiser_user)

    assert_difference('Campaign.count', -1) do
      delete "/campaigns/#{campaigns(:first).id}"
    end

    assert_redirected_to vendor_campaigns_path(vendor_id: advertisers(:first).id)
    assert_equal assigns(:campaign), campaigns(:first)
  end

  # Helpers

  def create_params
    {
      request_type: 'recommendation',
      campaign: {
        name: 'New Campaign',
        advertiser_id: advertisers(:first).id,
        campaign_type: :pre_sales_media_plan,
        campaign_url: 'http://www.example.com/campaign',
        goal: 'Awareness',
        kpi: 'Click Through Rate (CTR)',
        conversion_rate: 0.2e2,
        average_order_value: 3000.0,
        target_cpa: 0.1e3,
        target_roas: 10,
        budget: 0.1e5,
        age_range_male: [30, 40],
        age_range_female: [20, 30],
        household_income: [50, 500],
        geography: ["Europe", "Hello"],
        geo_fence: ["Asia"],
        affinities: { 
          "10401" => {
            "name" => "Automotive",
            "provider" => "Acxiom US",
            "description" => "Household specific information about current vehicle of likely next vehicle"
          }
        },
        football_analysis: true,
        crm_data: true,
        contextual_targeting: true,
        brand_safety: true,
        targeting_notes: 'These are some notes related to targeting'
      }
    }
  end
end
