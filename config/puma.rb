app_port = Integer(ENV['PORT'] || 3000)
rack_env = ENV['RACK_ENV'] || 'development'
min_threads = Integer(ENV['MIN_THREADS'] || 4)
max_threads = Integer(ENV['MAX_THREADS'] || 16)

threads(min_threads, max_threads)
preload_app!

rackup(DefaultRackup)
port(app_port)
environment(rack_env)
