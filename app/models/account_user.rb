class AccountUser < ApplicationRecord

  ## IDENTIFIER (start) ======================================================
  self.primary_key = :account_user_id
  ## IDENTIFIER (end)

  ## ACCESSORS (start) =======================================================

  ## ACCESSORS (end)

  ## DEFAULTS (start) ========================================================
  before_validation :set_defaults
  ## DEFAULTS (end)

  ## ASSOCIATIONS (start) ====================================================
  belongs_to :account, foreign_key: :account_id
  belongs_to :user, foreign_key: :user_id
  ## ASSOCIATIONS (end)

  ## NESTED ATTRIBUTES (start) ===============================================
  ## NESTED ATTRIBUTES (end)

  ## VALIDATIONS (start) =====================================================
  ## VALIDATIONS (end)

  ## HOOKS (start) =====================================================
  ## HOOKS (end)

  ## SCOPES (start) =====================================================
  ## SCOPES (end)

  private

  # Helper sets all defaults on the current model prior to VALIDATIONS
  def set_defaults
    self.state ||= 'ACTIVE'
    self.account_user_id ||= Gizmo::Util::Uuid.generate
    self.is_owner ||= false
  end # def set_defaults

end # class Account
