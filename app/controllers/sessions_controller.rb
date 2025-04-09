class SessionsController < ApplicationController
    def create
      user = User.find_by(email: params[:email])
  
      if user&.authenticate(params[:password])
        # Use Doorkeeper to create a token for the user
        token = Doorkeeper::AccessToken.create(
          application: Doorkeeper::Application.first, # Assuming you have at least one Doorkeeper application
          resource_owner_id: user.id,
          scopes: 'public'
        )
  
        render json: { access_token: token.token, token_type: 'bearer', expires_in: token.expires_in }
      else
        render json: { error: 'Invalid credentials' }, status: :unauthorized
      end
    end
  end
  