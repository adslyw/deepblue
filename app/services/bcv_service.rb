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

  def exec_mission(mission,*args)
    if !mission.params.empty? and !args.empty?
      params = Hash[mission.params.split(',').zip(args)]
      params.each{ |key,val|
        param = round_with(val.join("','"),"'")
        eval "@#{key}= param"
      }
    end

    sql = eval mission.sql
    p sql
    eval %Q{@executor.#{mission.sql_type}(sql)}
  end

  private
    def round_with(str,char)
      char+str+char
    end
end
