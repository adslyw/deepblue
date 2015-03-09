class Mission < ActiveRecord::Base
  alias_attribute :name, :description
  def to_hash
    {
      sql: self.sql,
      params: self.params,
      type: self.sql_type.to_sym
    }
  end
end
