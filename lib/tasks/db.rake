require 'gizmo'

namespace :db do

  desc 'Rebuilds the database'
  task :rebuild do

    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke

  end

  desc 'Runs all seed files under seed folder'
  task seed: :environment do
    Gizmo::Util::Data::Seeder.run!
    Rake::Task["db:demo"] if ENV['SUPPORTS_DEMO'] == 'true'
  end

  desc 'Runs all demo files under demo folder'
  task demo: :environment do
    Gizmo::Util::Data::Seeder.run!(include_demo: true)
  end

end
