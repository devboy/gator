class Gator
  module ActAsConfiguration

      def add_property(name, val=nil)

        create_method "#{name.to_s}=" do |val|
          instance_variable_set("@#{name}", val)
        end

        create_method name do | &block |
          block.call(instance_variable_get("@#{name}")) if block
          instance_variable_get("@#{name}")
        end

        instance_variable_set("@#{name}", val) if val
      end

      private

      def create_method(name, &block)
        self.class.send(:define_method, name, &block)
      end

    end
end