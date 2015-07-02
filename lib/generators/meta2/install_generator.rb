require 'rails/generators/base'

module Meta2
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a Meta2 initializer and copy locale files to your application."
      class_option :orm

      def copy_initializer
        target_file_path = 'config/initializers/meta2.rb'
        template target_file_path, target_file_path
      end

      def copy_locale
        target_file_path = 'config/locales/meta2.ja.yml'
        copy_file target_file_path, target_file_path
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end
