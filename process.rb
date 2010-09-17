class Pro
	def call(env)
		arr = Array.new
		t_arr = Array.new
		
		#read from master doc file; assign to array
		File.open('thedocument.xml', 'r') do |f|
			while line = f.gets
			arr << line
			arr.to_s
			end
		end
		
		#read from temp file; assign to array
		File.open('temp.xml', 'r') do |f2|
			while t_line = f2.gets
			t_arr << t_line
			end
		end
		
		#test to see if temp file is empty; if not, add contents of temp file to master doc
		unless t_arr.empty?
		t_arr.to_s
		arr += t_arr 	
		File.open('thedocument.xml', 'w') do |c|
			c.write arr
			end
		end
		
		#clear out the temp file
		File.open('temp.xml', 'w') do |erase|
			erase.write ''
		end
		#run the app
		[ 200, {"Content-Type" => "text/html"}, arr ]
	end
end