Gem::Specification.new do |s|
  s.name        = 'batch-ruby'
  s.version     = '0.0.0'
  s.summary     = "Batch Ruby"
  s.description = "A client for the batch.com Push Notification API"
  s.authors     = ["Nicholas Wittstruck"]
  s.email       = 'n.wittstruck@gmail.com'

  s.files       = Dir["{app,config,db,lib}/**/*", "Rakefile"]
  s.test_files = Dir["spec/**/*"]

  s.homepage    = 'https://github.com/nwittstruck/batch-ruby'
  s.license     = 'MIT'

  s.add_dependency "faraday"
end