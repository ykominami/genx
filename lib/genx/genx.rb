# frozen_string_literal: true

module Genx
	require 'erubis'
	require 'pathname'
	require 'yaml'

	class Genx
		def initialize(argv)
			plugin_name = argv.shift
			plugin_classname = plugin_name.capitalize + 'Plugin'
			puts plugin_classname
		end

		def run
			ret = 1
			ret
=begin
			eruby = Erubis::Eruby.new(@templ_content)
			result = eruby.result(hash)
			Mkspec::Loggerxcm.debug("0 extract_with_eruby result=#{result}")
			Mkspec::Loggerxcm.debug("=========== 4")
			result
=end
		end
	end
end
