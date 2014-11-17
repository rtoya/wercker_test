namespace :db2 do
  desc "db2 configuration"
  task :set_db_config do
    ENV['SCHEMA'] = 'db/schema.rb'
    Rails.application.config.paths['db'] = ['db']
    Rails.application.config.paths['db/migrate'] = ['db/migrate']
    Rails.application.config.paths['db/seeds'] = ['db/seeds.rb']
    Rails.application.config.paths['config/database'] = ['config/log_database.yml']
  end

  task drop: :set_db_config do
    Rake::Task['db:drop'].invoke
  end

  task create: :set_db_config do
    Rake::Task['db:create'].invoke
  end

  task migrate: :set_db_config do
    Rake::Task['db:migrate'].invoke
  end

  task rollback: :set_db_config do
    Rake::Task['db:rollback'].invoke
  end

  task seed: :set_db_config_paths do
    Rake::Task['db:seed'].invoke
  end

  task version: :set_db_config do
    Rake::Task['db:version'].invoke
  end
end
