Pry.config.theme = "pry-modern-256"

if ENV["BENCHMARK"]
  require 'bundler/inline'

  gemfile do
    source 'https://rubygems.org'
    gem 'benchmark-ips'
  end
end

require 'awesome_print' unless defined?(AwesomePrint)
AwesomePrint.pry!

# useful when pasting json
def null; nil end

def bm(iterations)
  require "benchmark"

  Benchmark.bm do |bm|
    # execute block
    bm.report do
      iterations.times do
	yield
      end
    end
  end
end

def bm_compare(n, **examples)
  require "benchmark"

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


def time_method(method=nil, *args)
  beginning_time = Time.now

  if block_given?
    yield
  else
    self.send(method, args)
  end

  end_time = Time.now

  puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"
end

# Rails
def rcc
  Rails.cache.clear
  puts "Cache cleared!"
end

def as!
  require 'active_support/all'
end

if ENV["SQL"] || ENV["RAILS_ENV"] == "test"
  ActiveRecord::Base.logger = Logger.new(STDOUT) if defined?(ActiveRecord::Base)
end

def dbexec(*args)
  ActiveRecord::Base.connection.execute(*args)
end

def rp
  request.params
end

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
