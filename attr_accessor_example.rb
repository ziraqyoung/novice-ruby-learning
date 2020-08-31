class Class
  def add_accessor(accessor_name)
    self.class_eval %{
      def #{accessor_name}
        @#{accessor_name}
      end

      def #{accessor_name}=(value)
        @#{accessor_name} = value
      end
    }
  end
end

class Person
  # dupliacting the functionality of attr_accessor
  add_accessor :name
end

p = Person.new
p.name = 'John Doe'

p p.name
