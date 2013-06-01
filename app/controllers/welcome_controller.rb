class WelcomeController < ApplicationController
  #before_filter :authenticate_user!
  def index

  end
  def auth
    sid = "AC4af9426d4c30aaee027a1a4d9ec06ea1" 
    auth_token = "304378edb54f8286d6e22e53eb828941" 
    capability = Twilio::Util::Capability.new sid, auth_token 
    capability.allow_client_outgoing 'AP1de9b8812688c4f482a127423e6f1bd6'
    @token = capability.generate
    render :json => @token
  end
  
  def text
    @city = "Singapore"
    @state = "Singapore"
    render 'process.xml.erb', :content_type => 'text/xml'
  end
end
