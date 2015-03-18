class Mission < ActiveRecord::Base
  alias_attribute :name, :description
  has_many :tasks
  def to_hash
    {
      sql: self.sql,
      params: self.params,
      type: self.sql_type.to_sym
    }
  end
  def has_params?
    self.params != ''
  end
end
