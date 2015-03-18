class Mission < ActiveRecord::Base
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
