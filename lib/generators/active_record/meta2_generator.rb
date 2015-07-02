require 'rails/generators/active_record'

module ActiveRecord
  module Generators
    class Meta2Generator < ActiveRecord::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def copy_meta2
        migration_template 'migration.rb', "db/migrate/create_#{table_name}.rb"
      end
    end
  end
end
