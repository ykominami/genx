# frozen_string_literal: true

module Genx
	require 'erubis'
	require 'pathname'
	require 'yaml'

	class Genx
		def initialize(argvx)
			plugin_name = argvx[0]
			module_name = "Genx"
			plugin_classname = plugin_name.capitalize + 'Plugin'
			plugin_classname_with_ns = [module_name , plugin_name.capitalize + 'Plugin'].join('::')
			@plugin_klass = Object.const_get(plugin_classname_with_ns)

			@plugin_object = @plugin_klass.new(argvx)
		end

		def run
			ret , ary = @plugin_object.run
		end
	end
end
