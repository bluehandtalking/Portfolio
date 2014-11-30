DisqusRails.setup do |config|
  config::SHORT_NAME = "ruby-reflections"
  config::SECRET_KEY = "ENV[DISQUS_SECRET_KEY]" #leave blank if not used
  config::PUBLIC_KEY = "ENV[DISQUS_PUBLIC_KEY]" #leave blank if not used
  config::ACCESS_TOKEN = "ENV[DISQUS_ACCESS_TOKEN]" #you got it, right? ;-)
end
