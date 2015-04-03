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
  def method_missing(name)
    if mission = Mission.find_by(:name => name)
      puts "@executor.#{mission.sql_type}(\"#{mission.sql}\")"
      puts %Q{ lambda { |#{mission.params}| @executor.#{mission.sql_type}("#{mission.sql}") } }
      eval %Q{ lambda { |#{mission.params}| @executor.#{mission.sql_type}("#{mission.sql}") } }
    end
  end

  def exec_mission(mission,input={})
    if !mission.params.empty? and !input.empty?
      input.each{ |key,val|
        val = val.join("','") if val.is_a? Array
        param = round_with(val,"'")
        eval "@#{key}= param"
      }
    end
    sql = eval mission.sql
    case mission.sql_type
    when 'exec'
      @executor.exec sql
    when 'query'
      @executor.query sql
    end
  end

  private
    def round_with(str,char)
      char+str+char
    end
end
