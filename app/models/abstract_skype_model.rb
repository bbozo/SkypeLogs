class AbstractSkypeModel < ActiveRecord::Base

  self.abstract_class = true

  self.inheritance_column = 'RailsType'

  def self.skype_time_columns *columns
    columns.each do |column|
      class_eval <<RUBY
        def #{column}
          Time.at(super)
        end
        def #{column}=arg
          super(arg.to_i)
        end
RUBY
    end
  end

  def self.skype_table_name!
    self.table_name = self.to_s.pluralize
  end

  def readonly?
    true
  end

end
