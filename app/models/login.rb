class Login < ActiveRecord::Base

  ## IDENTIFIER (start) ======================================================
  self.primary_key = 'user_id'
  ## IDENTIFIER (end)

  ## ACCESSORS (start) =======================================================
  ## ACCESSORS (end)

  ## DEFAULTS (start) ========================================================
  before_validation :set_defaults
  ## DEFAULTS (end)

  ## ASSOCIATIONS (start) ====================================================
  belongs_to :account_user, foreign_key: :user_id
  #belongs_to :user, through: :account_user
  ## ASSOCIATIONS (end)

  ## VALIDATIONS (start) =====================================================
  validates :account_user_id, presence: true, allow_blank: false
  validates :attempted_at, presence: true
  ## VALIDATIONS (end)

  private

  # Helper sets all defaults on the current model prior to validation.
  def set_defaults
      self.account_user_id ||= AccountUser.current.user_id
      self.was_successful ||= false
      self.attempted_at ||= Time.now
  end # def set_defaults

end # class Login
