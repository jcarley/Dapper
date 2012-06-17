class PresenterGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  argument :actions, :type => :array, :default => ["index"], :banner => "action action"

  check_class_collision
  desc "Generate presenter."

  def manifest
    actions.each do |action|
      @action = action
      template "view_presenter_template.html.erb", "app/presenters/#{file_name}/#{action}_presenter.rb"
    end
  end
end
