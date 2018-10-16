require 'socket'

server = TCPServer.new(2345)

loop do
  Thread.start(server.accept) do |socket|
    they_said = 'nothing'
    until they_said == 'quit'
      socket.puts 'What do you say?'
      they_said = socket.gets.chomp
      socket.puts "You said: #{they_said}." unless they_said == 'quit'
    end
    socket.puts 'Goodbye!'
    socket.close
  end
end
