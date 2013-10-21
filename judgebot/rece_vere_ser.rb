require 'socket'
require 'httparty'
require 'json'
require 'absolute_time'

class SConsumer
  include HTTParty
  format :json
  basic_auth 'user', 'password'
end


class RVeredict

  def initialize()
    @base_uri = 'http://localhost:3000'
    @data = open("test_fifo", "r+")    
  end
  
  def append(s)
    f = File.open("time2","a+")
    f.write(s)
    f.close
  end

  def run_rv()

      loop do
          v = @data.gets
          ver = v.split(",")
          puts "Receiving veredict=#{v}"
          ur = "#{@base_uri}/submissions/#{ver[0]}/update_veredict.json"
          response = SConsumer.get(ur,:query => { :veredict => ver[1], :time => ver[2] })
          time = AbsoluteTime.now
          append(ver[0].to_s+" "+time.to_s+"\n")
      end
  end
end

rv = RVeredict.new
rv.run_rv
