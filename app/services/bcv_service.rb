class BcvService
  class ConnectionError < StandardError; end
  def initialize()
    @executor = Record::Executor.new(:bcv)
  end
  def process(input = {})
    raise ConnectionError.new unless !@executor.nil?
    if !input[:sql].nil? or input[:sql]
      case input[:type]
      when :exec
        @executor.exec(input[:sql]) if input[:sql]
      when :query
        @executor.query(input[:sql]) if input[:sql]
      end
    else
    end
  end
  def mkdblink
    begin
      @executor.make_database_link(:crm,"bill2crm")
      return true
    rescue
      return false
    end
  end
end
