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

def method_missing name, *args, &block
  return Newspaper.find(name[/.*(\d+)/, 1]) if name =~ /n\d+/
  return NewspaperConfig.find(name[/.*(\d+)/, 1]) if name =~ /c\d+/
  return Event.find(name[/.*(\d+)/, 1]) if name =~ /e\d+/
  return EventPromotion.find(name[/.*(\d+)/, 1]) if name =~ /ep\d+/
  return Feed.find(name[/.*(\d+)/, 1]) if name =~ /f\d+/
  return NewspaperuserSubscriptionPlan.find(name[/.*(\d+)/, 1]) if name =~ /s\d+/

  return if name =~ /to_\w+/
  super
end
