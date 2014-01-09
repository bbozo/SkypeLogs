class AbstractSkypeModel < ActiveRecord::Base

  self.abstract_class = true

  def self.skype_table_name!
    self.table_name = self.to_s.pluralize
  end

  def readonly?
    true
  end

end
