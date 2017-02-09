class Admin < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :recoverable,
           :rememberable, :trackable, :validatable,
           :timeoutable, request_keys: []

    ## IDENTIFIER (start) ======================================================
    self.primary_key = 'admin_id'
    ## IDENTIFIER (end)

    ## ACCESSORS (start) =======================================================
    ## ACCESSORS (end)

    ## DEFAULTS (start) ========================================================
    before_validation :set_defaults
    ## DEFAULTS (end)

    ## ASSOCIATIONS (start) ====================================================

    ## ASSOCIATIONS (end)

    ## NESTED ATTRIBUTES (start) ===============================================

    ## NESTED ATTRIBUTES (end)

    ## VALIDATIONS (start) =====================================================
    validate :password_complexity
    validate :email_format

    def password_complexity
        if password.present? && !password.match(/(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[\W])/)
            errors.add :password, 'must be 8-20 characters long and include 3 of the following: uppercase letters, lowercase letters, numbers and special characters (!, @, #, $, etc.).'
        end
    end

    def email_format
        unless email.include?('@') && email.include?('.')
            errors.add :email, 'not a valid email address'
        end
    end
    ## VALIDATIONS (end)

    ## HOOKS (start) =====================================================
    ## HOOKS (end)

    ## SCOPES (start) =====================================================
    ## SCOPES (end)

    def full_name
      email
    end

    private

    # Helper sets all defaults on the current model prior to VALIDATIONS
    def set_defaults
      self.admin_id ||= Gizmo::Util::Uuid.generate
    end # def set_defaults
end
