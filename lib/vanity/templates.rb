module Vanity
  module Templates
    extend self

    # Path to template.
    def template(name)
      File.join(template_directory, name)
    end

    def template_directory
      @template_directory ||= load_paths.find { |dir| File.exists?(dir) }
    end

    private

    def load_paths
      [rails_template_path, gem_template_path].compact
    end

    def rails_template_path
      File.join(::Rails.root, 'app', 'views', 'vanity') if defined?(::Rails)
    end

    def gem_template_path
      File.join(File.dirname(__FILE__), 'templates')
    end
  end

  class << self
    def template(name)
      Templates.template(name)
    end
  end
end
