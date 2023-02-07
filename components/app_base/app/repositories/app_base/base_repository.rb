module AppBase
  module BaseRepository

    def self.included(base)
      @scopes = []
      base.extend(ClassMethods)
    end

    def initialize(args={})
      self.attributes = args
    end

    def attributes=(attributes={})
      attributes.each do |k, v|
        self.send "#{k}=", v
      end
    end

    def to_hash
      Hash[*instance_variables.map { |v|
        [v.to_s.tr('@', '').to_sym, instance_variable_get(v)]
      }.flatten]
    end

    module ClassMethods
      def find(id)
        find_by(id:)
      end

      def find_by(*params)
        external_record = external_class.find_by(*params)
        adapter.convert(external_record)
      end

      def first
        external_record = apply_chained_methods
        adapter.convert(external_record.first)
      end

      def where(*params)
        external_records = apply_chained_methods.where(*params)
        external_records.map { |external_record| adapter.convert(external_record) }
      end

      def all
        external_records = apply_chained_methods.all
        external_records.map { |external_record| adapter.convert(external_record) }
      end

      def count
        external_count = apply_chained_methods
        external_count.count
      end

      def pluck(*keys)
        external_class.pluck(keys)
      end

      def includes(*args)
        add_chained_method :includes, args
      end

      def chained_methods
        @chained_methods ||= []
      end

      def apply_chained_methods
        chained_records = external_class
        if chained_methods.present?
          chained_methods.each do |method_obj|
            chained_records =
              method_obj[:args].present? ?
                chained_records.public_send(method_obj[:method], method_obj[:args]) :
                chained_records.public_send(method_obj[:method])
          end
          reset_chained_methods
        end
        chained_records
      end

      def add_chained_method(method, args=nil)
        chained_methods << { method:, args: }
        self
      end

      def reset_chained_methods
        @chained_methods = []
        self
      end
    end
  end
end
