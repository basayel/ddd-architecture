module EntryPoints
  extend ActiveSupport::Concern

  included do
    load_entry_points
  end

  class_methods do
    def load_entry_points
      Extractor.new(type: graphql_name.downcase).extract do |field_name, key, endpoint_class|
        field field_name, key => endpoint_class
      end
    end
  end

  class Extractor
    def initialize(type:)
      @type = type
      @exceptions = %W(base_#{@type}.rb)
      @directory = Rails.root.join('app', 'graphql')
      @file_paths = Rails.root.join(@directory, type.pluralize, '**', '*.rb')
      @key = { mutation: :mutation, query: :resolver }[type.to_sym]
    end

    def reserved?(file_name)
      @exceptions.include?(file_name)
    end

    def relative_dir(dir)
      dir.gsub(/^.*#{@directory}\//, '')
    end

    def file_paths
      Dir[@file_paths].map { |path| relative_dir(path) }
    end

    def files
      file_paths.map { |path| File.new(path) }
    end

    def extract
      files.each do |file|
        next if reserved?(file.name)

        yield file.field_name, @key, file.endpoint_class
      end
    end

    class File
      attr_accessor :name

      def initialize(path)
        @path = path
        @namespace, @name = ::File.split(path)
      end

      def field_name
        @name.gsub(/(_query|_mutation)?.rb$/, '')
      end

      def endpoint_class
        endpoint_name = @name.gsub('.rb', '')
        "#{@namespace.camelize}::#{endpoint_name.camelize}".constantize
      end
    end
  end
end
