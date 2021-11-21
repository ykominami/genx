module Genx
	class VarsPlugin < Plugin
		def initialize(args)
			@argv = argv
			@yaml_file = @argv[0]
			@templ_file = @argv[1]
			@templ_vars_file = @argv[2]

			templ_pn = Pathname.new(@templ_file)
			@templ_content = Util.get_file_content(templ_pn)
#p @templ_content
			templ_vars_pn = Pathname.new(@templ_vars_file)
			@templ_vars_content = Util.get_file_content(templ_vars_pn)

			yaml_pn = Pathname.new(@yaml_file)
			yaml_content = Util.get_file_content(yaml_pn)
#p yaml_content
			@hs = YAML.load(yaml_content)
			end
		end

		def run
			ret_code = 0
			@hs.each do |key, val|
				val.each do |k2, v2|
					puts key
					puts v2
				end
				ret_code
			end
		end
end