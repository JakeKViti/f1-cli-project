require_relative "./project/version"

module Project
  class Error < StandardError; end
  # Your code goes here...
end


require 'pry'
require 'rest-client'
require 'json'


require_relative "./project/api"
require_relative "./project/cli"
require_relative "./project/seasons"
require_relative "./project/circuit"
require_relative "./project/year"