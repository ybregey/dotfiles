def rcc
  Rails.cache.clear
  puts "Cache cleared!"
end

def n id
  Newspaper.find id
end

def c id
  NewspaperConfig.find id
end

def f id
  Feed.find id
end

def e id
  Event.find id
end

def ep id
  EventPromotion.find id
end

def local
  Newspaper.find_by_custom_domain! 'localhost'
end

def local! id
  NewspaperConfig.where(newspaper_id: id).update custom_domain: 'localhost'
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

