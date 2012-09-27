require 'mongodb_logger/initializer_mixin'
module MongodbLogger
  class Railtie < Rails::Railtie
    include MongodbLogger::InitializerMixin
    
    initializer :initialize_mongodb_logger, :after => :'mongo_mapper.initialize_database' do
      app_config = Rails.application.config
      Rails.logger = config.logger = create_logger(app_config)
    end
    
    rake_tasks do
      load "tasks/mongodb_logger.rake"
    end
    
  end
end
