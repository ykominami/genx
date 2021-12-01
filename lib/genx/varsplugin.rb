module Genx
	class VarsPlugin < Plugin
		def initialize(argv1)
			@argvx1 = argv1
			@yaml_file = @argvx1[1]
			@templ_file = @argvx1[2]
			@templ_vars_file = @argvx1[3]

			templ_pn = Pathname.new(@templ_file)
			@templ_content = Util.get_file_content(templ_pn)
			templ_vars_pn = Pathname.new(@templ_vars_file)
			@templ_vars_content = Util.get_file_content(templ_vars_pn)

			yaml_pn = Pathname.new(@yaml_file)
			yaml_content = Util.get_file_content(yaml_pn)
			@yaml_hs = YAML.load(yaml_content)
		end

		def run
			ret_code = 0
			eruby_class = Erubis::Eruby.new(@templ_content)
			eruby_vars = Erubis::Eruby.new(@templ_vars_content)
			data_hs = {}
			ary = @yaml_hs.map{
				|classname, hs|
				hs.map{ |group_id, hs2|
					varnames, var_list = make_var_def(eruby_vars, hs2)
					data_hs["classname"] = classname
					data_hs["var_list"] = var_list.join("\n")
					data_hs["varname_list"] = varnames.join(",")
					eruby_class.result(data_hs)
				}
			}
			[ret_code, ary]
		end

		def make_var_def(eruby, hs)
			varnames = []
			list = []
			hs_vars = {}
			if hs["vars"]
				hs["vars"].each do |var_name, var_value|
					hs_vars["var_name"] = var_name
					hs_vars["var_value"] = var_value
					varnames << var_name
					list << eruby.result(hs_vars)
				end
			end
			[varnames, list]
		end
	end
end