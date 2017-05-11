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

