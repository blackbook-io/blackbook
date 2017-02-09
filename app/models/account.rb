class Account < ApplicationRecord
    ## IDENTIFIER (start) ========================================================
    self.primary_key = :account_id
    ## IDENTIFIER (end)

    ## ACCESSORS (start) =========================================================
    ## ACCESSORS (end)

    ## DEFAULTS (start) ==========================================================
    before_validation :set_defaults
    ## DEFAULTS (end)

    ## ASSOCIATIONS (start) ======================================================
    has_many :account_users, dependent: :destroy, foreign_key: :account_id
    has_many :users, through: :account_users
    ## ASSOCIATIONS (end)

    ## NESTED ATTRIBUTES (start) =================================================
    ## NESTED ATTRIBUTES (end)

    ## VALIDATIONS (start) =======================================================
    validates :account_id,       presence: true,
                                 length: { is: 32 }
    validates :account_name,     length: { minimum: 2, maximum: 100 },
                                 allow_blank: false
    validates :subdomain,        uniqueness: true,
                                 length: { minimum: 2, maximum: 50 },
                                 allow_blank: false
    validates :custom_domain,    uniqueness: true,
                                 length: { minimum: 5, maximum: 100 },
                                 allow_blank: true
    validates :state,            presence: true,
                                 allow_blank: false
    ## VALIDATIONS (end)

    ## HOOKS (start) =============================================================
    ## HOOKS (end)

    ## SCOPES (start) ============================================================

    ## SCOPES (end)

    ## SEARCH (start) ============================================================
    def self.search(criteria, params={})
        # TODO
    end
    ## SEARCH (end)

    ## HELPERS (start) ===========================================================

    def self.owners(account)
      account ? account.account_users.where(is_owner: true).all : []
    end

    def self.default_account
      Account.where(subdomain: 'hq').first
    end

    def self.current
        Thread.current[:account]
    end

    def self.current=(account)
        Thread.current[:account] = account
    end

    def self.current_subdomains
        Thread.current[:account_subdomains]
    end

    def self.current_subdomains=(subdomains)
        Thread.current[:account_subdomains] = subdomains
    end

    def self.current_port
        Thread.current[:account_port]
    end

    def self.current_port=(port)
        Thread.current[:account_port] = port
    end

    def self.current_protocol
        Thread.current[:account_protocol]
    end

    def self.current_protocol=(protocol)
        Thread.current[:account_protocol] = protocol
    end


    # Determines if the supplied user is an owner of the account.
    def has_owner? user
      self.account_users.where(user: user, is_owner: true).count > 0
    end
    ## HELPERS (end)

    private

    # Helper sets all defaults on the current model prior to VALIDATIONS
    def set_defaults
        self.state ||= 'NEW'
        self.account_id ||= Gizmo::Util::Uuid.generate
        self.account_name ||= self.subdomain
    end # def set_defaults
end # class Account
