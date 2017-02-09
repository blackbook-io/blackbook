module Gizmo

  ## MODULES
  module Util
    module Data

      autoload :Seeder, 'gizmo/util/data/seeder'
      autoload :SeedProxy, 'gizmo/util/data/seed_proxy'

    end
    
    autoload :Uuid, 'gizmo/util/uuid'
  end


  ## CONSTANTS
  BASE_DOMAIN = ENV['GIZMO_BASE_DOMAIN'] || 'gizmo.dev'
  DOMAIN_BLACKLIST = %w( app hq www support help my your our dev sandbox qa)

end
