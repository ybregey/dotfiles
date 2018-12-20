Pry.config.theme = "pry-modern-256"

require 'awesome_print'
AwesomePrint.pry!

require "benchmark"
#require "benchmark/ips"

def rcc
  Rails.cache.clear
  puts "Cache cleared!"
end

def bm(iterations)
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

  puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds".colorize(:red)
end
