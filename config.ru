# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
Dotenv.load
run Rails.application

