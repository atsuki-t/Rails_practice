begin
  require "awesome_print"
  Pry.config.print = proc { |output, value| output.puts value.ai }
rescue LoadError
  puts "no awesome_print :("
end
