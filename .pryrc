# frozen_string_literal: true

# gem install pry-toys
# Array.toy(3, Float) # => [1.0, 2.0, 3.0]
# Array.toy(3) {|i| i + 3} # => [3, 6, 9]
# Hash.toy(300) # => { a: 1, b: 2, ..., kn: 300 }
# String.toy(2) # => "ttttttt oooo"

# gem install pry-theme
Pry.config.theme = "pry-modern-256"

# Benchmarks

if ENV["BENCHMARK"]
  require "bundler/inline"
  gemfile do
    source 'https://rubygems.org'
    gem "benchmark-ips"
  end
end

def __bm(iterations)
  require "benchmark"
  Benchmark.bm do |bm|
    bm.report do
      iterations.times(&block)
    end
  end
end

def __bmc(examples = nil, n = 100)
  unless examples
    puts "__bmc({ 'name1' => lambda1, 'name2' => lambda2 }, 1000)"
    return
  end

  require "benchmark"
  Benchmark.bm do |bm|
    examples.each do |name, block|
      bm.report(name) { n.times(&block) }
    end
  end
end

def __ips(examples = nil)
  unless examples
    puts "__ips({ 'name1' => lambda1, 'name2' => lambda2 })"
    return
  end

  require "benchmark/ips"
  Benchmark.ips do |x|
    examples.each { |name, block| x.report(name, block) }
    x.compare!
  end
end

def __time
  starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  yield
  ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  puts(ending - starting)
end

def as_subscribe(event_name)
  as!
  ActiveSupport::Notifications.subscribe(event_name) do |event|
    puts "Event: #{event.inspect}"
    puts "Started: #{event.time}"
    puts "Finished: #{event.end}"
    puts "Duration (ms): #{event.duration}"
    puts "CPU time (ms): #{event.cpu_time}"
    puts "Idle time (ms): #{event.idle_time}"
    puts "# of objects allocated: #{event.allocations}"
  end
end

def as_instrument(event_name, &block)
  ActiveSupport::Notifications.instrument(event_name, &block)
end

def ap!
  require "awesome_print" unless defined?(AwesomePrint)
  AwesomePrint.pry!
end

# returns the instance methods on klass that aren't already on Object
def m(klass)
  klass.public_instance_methods - Object.public_instance_methods
end

# useful when pasting json
def null; nil end

# Rails
def rcc
  Rails.cache.clear
  puts "Rails cache cleared!"
end

def as!
  require "active_support/all"
end

def fb!
  require "factory_bot"
  FactoryBot.definition_file_paths = [File.expand_path('../spec/factories', __FILE__)]
  FactoryBot.find_definitions
  include FactoryBot::Syntax::Methods
end

def ti(multiplier = 1)
  as!
  Time.current.to_i * multiplier
end

# log SQL queries for debugging
def sqlog
  ActiveRecord::Base.logger = Logger.new($stdout) if defined?(ActiveRecord::Base)
end

sqlog if ENV["SQL"] || ENV["RAILS_ENV"] == "test"

def ce(...)
  ApplicationRecord.connection.execute(...)
end

def params
  super
rescue
  defined?(request) ? request.params : super
end

# recognize route
def r(path)
  %i[get post put patch delete].each_with_object({}) do |method, memo|
    memo[method.to_s.upcase] = Rails.application.routes.recognize_path(path, method: method) rescue next
  end
end

# useful for copypasting let setups from specs
def let(var_name, &block)
  return super if defined?(RSpec) && ENV["RAILS_ENV"] == "test"
  define_method(var_name) { block.call }
end

def let!(...)
  return super if defined?(RSpec)
  let(...) # TODO: @ybrehei add memoization
end

def j(...)
  JSON.load(...)
end

# Pry cheatsheet
def cheatsheet
  puts <<-TXT
    help ls -- Display command options for pry command ls
    ls <Object> -- Show all of the available methods that can be called by an object
    _ -- Last eval
    ? <Object> -- Shows more information (doc) about an object, or method
    _file_ -- Represent the last file Pry touched
    wtf? -- Print the stack trace, same as _ex_.backtrace
    $ -- Show source, shortcut for show-source
    edit Class -- Open file in $EDITOR
    edit Class#instance_method -- Open file in $EDITOR
    <ctrl+r> -- Search history
    _out_ -- Array of all outputs values, also _in_
    cd <var> -- Step into an object, change the value of self
    cd .. -- Take out of a level
    edit --ex -- Edit the file where the last exception was thrown
    .<Shell> -- Runs the command
    whereami -- Print the context where the debugger is stopped
    whereami 20 -- Print the context 20 lines where the debugger is stopped
    ; -- Would mute the return output by Ruby
    play -l -- Execute the line in the current debugging context
    show-source Class
  TXT
end
