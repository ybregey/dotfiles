require "benchmark"
#require "benchmark/ips"

def rcc
  Rails.cache.clear
  puts "Cache cleared!"
end

def n(id)
  Newspaper.find(id)
end

def c(id)
  NewspaperConfig.find(id)
end

def f(id)
  Feed.find(id)
end

def e(id)
  Event.find(id)
end

def ep(id)
  EventPromotion.find(id)
end

def localhost?
  Newspaper.find_by_custom_domain!("localhost")
end

def localhost!(id)
  NewspaperConfig.find_by(custom_domain: "localhost")&.update(custom_domain: (0...8).map { (65 + rand(26)).chr }.join)

  NewspaperConfig.find_by!(newspaper_id: id).update(custom_domain: 'localhost')
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

