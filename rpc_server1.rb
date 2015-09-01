#!/usr/bin/env ruby
# encoding: utf-8

require "bunny"

conn = Bunny.new
conn.start

ch   = conn.create_channel

class FibonacciServer

  def initialize(ch)
    @ch = ch
  end

  def start(queue_name)
    @q = @ch.queue(queue_name)
    @x = @ch.default_exchange

    @q.subscribe(:block => true) do |delivery_info, properties, payload|

      puts "payload [#{payload}] "
      payload =~ /^(\w*):([\w|\W]*)?/
      shell = "/home/#{$1}.sh"
      params = $2
     
      r =  File.exist?(shell) ? `/home/#{$1}.sh #{$2}` : "Error:Comando Inexistente" 
      puts r
      
      @x.publish(r, :routing_key => properties.reply_to, :correlation_id => properties.correlation_id)
    end
  end

end

begin
  server = FibonacciServer.new(ch)
  puts " [x] Awaiting RPC requests"
  server.start("rpc_queue")
rescue Interrupt => _
  ch.close
  conn.close
end
