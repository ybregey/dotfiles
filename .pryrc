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

require 'dotenv'
Dotenv.load('~/kaoss.env')

$aws_creds = {
  aws_access_key_id: ENV.fetch("AWS_ACCESS_KEY_ID"),
  aws_secret_access_key: ENV.fetch("AWS_SECRET_ACCESS_KEY"),
  region: ENV.fetch('AWS_REGION')
}

def fog_client!(creds = $aws_creds)
  require 'fog'
  $fog_client = Fog::Storage::AWS.new(creds)
end

def as!
  require 'active_support/all'
end
