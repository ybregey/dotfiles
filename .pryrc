def n id
  Newspaper.find id
end

def e id
  Event.find id
end

def local
  Newspaper.find_by_custom_domain! 'localhost'
end

def local! id
  NewspaperConfig.where(newspaper_id: id).update custom_domain: 'localhost'
end

