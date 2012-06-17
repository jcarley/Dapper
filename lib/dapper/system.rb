module Dapper

  class System
    def self.app_local_presenters_glob
      'app/presenters/**/*_presenter.rb'
    end

    def self.load_app_local_presenters
      presenter_files = Dir[ "#{ Rails.root }/#{ app_local_presenters_glob }" ]
      presenter_files.each { |d| require_dependency d }
    end

    def self.setup(component)
      component.class_eval do
        include Dapper::ViewContextFilter
      end
    end
  end
end
