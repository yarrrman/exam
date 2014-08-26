teml_path = "tickets.html"
@cur_file = ""
@cur_body = []
@cur_name = ""
@old_file = ""
@new_file = ""

templ_collect = File.open( teml_path ).each do |line| 
	
	if line.include? "</html>"
		@cur_body.push line
		@cur_file = File.new(@cur_name, 'w')
		@cur_body.each do |line|
			@cur_file.puts line
		end
		@cur_file.close
		@cur_name = ""
		@cur_body = []
	end 

	if line.include? "title"
		s = "	<title>Bilet 11</title>"
		s = line
		beg = line.index("<title>") + 13
		e = line.index("</title>")
		num = line[beg,e-beg]
		if num < 10 
			num = "0"+num
		end
		@cur_name = "ticket" + num + ".html"
	end

	if line.include? "<!DOCTYPE html>"
		@cur_file = ""
	end 



end




