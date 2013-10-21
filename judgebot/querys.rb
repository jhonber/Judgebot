require 'socket'
require 'thread'
require 'httparty'
require 'json'
require 'time'

class SConsumer
  include HTTParty
  format :json
  basic_auth 'user', 'password'
end

class Query
 
  def initialize()
    @base_uri = 'http://localhost:3000'
    @file  = 'time1'
    @file2 = 'time2'
  end

  def run()
    f1 = IO.readlines(@file)
    f2 = IO.readlines(@file2)
    subs = []
    v1 = []
    v2 = []

    for s in f1 do
      s = s[0,s.length-1]
      s = s.split(' ')
      subs << s[0]
      v1   << s[1].to_f
    end

    for s in f2 do
      s = s[0,s.length-1]
      s = s.split(' ')
      v2 << s[1].to_f
    end

    media    = 0.0
    varianza = 0.0
    datos = []
    n = subs.length
    i = 0
    for t in subs do
      tmp = v2[i]-v1[i]
      puts tmp
      media += tmp
      datos << tmp
      i += 1
    end

    media = media / n
    for j in 0..n-1
      varianza = varianza + (datos[j] - media)**2
    end

    varianza1 = varianza / n
    varianza2 = varianza / (n-1)

    puts "Media: ", media
    puts "Desviacion ", Math.sqrt(varianza1)
    puts "Desviacion (n-1)",Math.sqrt(varianza2)
    puts "Varianza",varianza2
    
  end

end

q = Query.new
q.run()
