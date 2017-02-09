class Users::RegistrationsController < Devise::RegistrationsController
    include AppAccess

    # GET /resource/sign_up
    # def new
    #   super
    # end

    # POST /resource
    # Overriden to support the account creation process. This action is not used
    # for its typical purpose of creating a user. User creation is handle within
    # applications by inviting users via email. Registration is utilized to create
    # new business accounts. During this process an existing user or a new user
    # may be supplied. If an existing user is provided then the account will be
    # created (ignoring passwords) followed by the user being forwarded to the new
    # account subdomain. No further comfirmation is required.
    # If the
    def create
        @user = User.where(email: sign_up_params[:email]).first || User.new(sign_up_params)
        @account = Account.new(subdomain: sign_up_params[:subdomain])

        if @account.valid?

            # Don't send the typical confirmation email. We need to relate to the
            # account first as its subdomain is required in the email link.
            @user.skip_confirmation_notification!
            @user.save if @user.new_record?

            if resource.persisted?
                if @account.save

                    # relate the user to the new account
                    @account.account_users.create(user: @user, is_owner: true)

                    Hanumi::OnboardingMailer.welcome_account(@account, @user).deliver_now

                    if resource.active_for_authentication?
                        set_flash_message! :notice, :signed_up
                        sign_up(resource_name, resource)
                        respond_with resource, location: after_sign_up_path_for(resource, @account)
                    else
                        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
                        expire_data_after_sign_in!
                        respond_with resource, location: after_inactive_sign_up_path_for(resource, @account)
                    end
                else
                  @account.errors.each { |k, v| resource.errors.add(k, v) }
                  flash[:alert] = resource.errors
                  respond_with resource, location: new_user_registration_path
                end

            else
                clean_up_passwords resource
                set_minimum_password_length
                flash[:alert] = resource.errors
                respond_with resource, location: new_user_registration_path
            end
        else

            @account.errors.each { |k, v| resource.errors.add(k, v) }
            flash[:alert] = resource.errors
            respond_with resource, location: new_user_registration_path
        end
    end # def create

    # GET /resource/edit
    # def edit
    #   super
    # end

    # PUT /resource
    # def update
    #   super
    # end

    # DELETE /resource
    # def destroy
    #   super
    # end

    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end

    protected

    def resource_params
        params.require(:user).permit(:user_id, :email, :password, :password_confirmation, :encrypted_password,
                                     :reset_password_token, :reset_password_sent_at, :remember_created_at,
                                     :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip,
                                     :last_sign_in_ip, :first_name, :last_name, :subdomain)
    end

    def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :subdomain)
    end

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_up_params
    #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    # end

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_account_update_params
    #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    # end

    # The path used after sign up.
    def after_sign_up_path_for(resource, account=nil)
      if account.nil?
        super(resource)
      else
        signin_url(subdomain: account.subdomain)
      end

    end

    # The path used after sign up for inactive accounts.
    def after_inactive_sign_up_path_for(resource, account=nil)
      if account.nil?
        super(resource)
      else
        signin_url(subdomain: account.subdomain)
      end
    end
end
