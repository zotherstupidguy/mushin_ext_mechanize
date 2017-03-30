require 'mushin'
require_relative 'mushin_ext_mechanize/version'


module MushinExtMechanize
  class Ext 
    using Mushin::Ext 

    def initialize app=nil, opts={}, params={}
      @app 		= app
      @opts 	= opts
      @params 	= params 
    end

    def check_params *keys
      return (keys.all? {|key| (@params.key?(key) && !@params[key].nil?)})
    end

    def call env 
      env ||= Hash.new 

      case @opts[:cqrs]
      when :cqrs_query 
	#inbound code
	@app.call(env)
	#outbound code
      when :cqrs_command
	#inbound code
	@app.call(env)
	#outbound code
      else
	raise "mushin_ext_mechanize requires you to specify if your cqrs call is command or query? example: opts[:cqrs_query] = true"
      end

    end
  end

end
