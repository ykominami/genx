module Genx
	# Utility class
	class Util
		class << self
			def get_file_content(file_path)
				get_file_content_lines(file_path).join("\n")
			end

			def get_file_content_lines(file_path)
				File.readlines(file_path).select{ |l| l !~ /^(\s*)#/ }.map(&:chomp)
			end
		end
	 # Returns the current time in milliseconds
	end
end
