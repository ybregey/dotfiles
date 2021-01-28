# gem install pry-toys
# Array.toy(3, Float) # => [1.0, 2.0, 3.0]
# Array.toy(3) {|i| i + 3} # => [3, 6, 9]
# Hash.toy(300) # => { a: 1, b: 2, ..., kn: 300 }
# String.toy(2) # => "ttttttt oooo"

# gem install pry-theme
Pry.config.theme = "pry-modern-256"

# Benchmarks

if ENV["BENCHMARK"]
  require 'bundler/inline'

  gemfile do
    source 'https://rubygems.org'
    gem 'benchmark-ips'
  end
end

def __bm(iterations)
  require "benchmark"

  Benchmark.bm do |bm|
    bm.report do
      iterations.times do
        yield
      end
    end
  end
end

def __bmc(examples = nil, n = 100)
  require "benchmark"

  if !examples
    puts "__bmc({ 'name1' => lambda1, 'name2' => lambda2 }, 1000)"
    return
  end

  Benchmark.bm do |bm|
    examples.each do |name, block|
      bm.report(name) do
        n.times do
          block.call
        end
      end
    end
  end
end

def __ips(examples = nil)
  require 'benchmark/ips'

  if !examples
    puts "__ips({ 'name1' => lambda1, 'name2' => lambda2 })"
    return
  end

  Benchmark.ips do |x|
    examples.each { |name, block| x.report(name, block) }
    x.compare!
  end
end

def __msr(method=nil, *args)
  beginning_time = Time.now

  if block_given?
    yield
  else
    self.send(method, args)
  end

  end_time = Time.now

  puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"
end

# Helpers

def ap!
  require 'awesome_print' unless defined?(AwesomePrint)
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
  include FactoryBot::Syntax::Methods
  FactoryBot.find_definitions
end

# log SQL queries for debugging
def sqlog
  ActiveRecord::Base.logger = Logger.new(STDOUT) if defined?(ActiveRecord::Base)
end

if ENV["SQL"] || ENV["RAILS_ENV"] == "test"
  sqlog
end

def ce(*args)
  ActiveRecord::Base.connection.execute(*args)
end

def params
  super
 resque
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
 return super if defined?(RSpec)

 define_method(var_name) { block.call }
end

def let!(var_name, &block)
  return super if defined?(RSpec)

  # TODO: @ybrehei add memoization
  let(var_name, &block)
end

# def j(*args)
#   JSON.load(...)
# end

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
    binding.pry -- Breakpoint
    edit --ex -- Edit the file where the last exception was thrown
    .<Shell> -- Runs the command
    whereami -- Print the context where the debugger is stopped
    whereami 20 -- Print the context 20 lines where the debugger is stopped
    ; -- Would mute the return output by Ruby
    play -l -- Execute the line in the current debugging context
  TXT
end


def ti
  as!

  Time.current.to_i * 1000
end
