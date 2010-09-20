class Pro
	def call(env)
		arr = Array.new
		t_arr = Array.new
		
		#read from master doc file; assign to array
		File.open('thedocument.xml', 'r') do |f|
			while line = f.gets
			#remove html tags from Title
			line = line.gsub(/<\/?[^>]*>/, "")
			arr += line.split(/ /)
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
			arr += t_arr 	
			
			#send thedocument with new text to shuffle method
			n = arr.count
			arr.to_s
			entry = Rearr.new(arr, n)
			entry.shuffle!
			
			#create a title
			t = []
			t = entry.slice!(0)	
			title = t.join(" ")
			
			#reassign arr variable to new shuffled text
			arr = entry.join(" ")

			File.open('thedocument.xml', 'w') do |c|
				c.write "<p class=\"center\"><b>#{title}</b></p> #{arr.squeeze(" ")}"
				end
		end
		
		#clear out the temp file
		File.open('temp.xml', 'w') do |erase|
			erase.write ''
		end
		
		#temp formatting
		header = 
"<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\">
<head>
<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />
<title>Cut Up</title>
<link rel=\"stylesheet\" type=\"text/css\" href=\"/stylesheets/cut.css\" />
<script language=\"JavaScript\" type=\"text/JavaScript\" src=\"\"></script>
</head>
<body>

<div id=\"left\">
<p>+ <a href=\"../\">Home</a> </p>
<p>+ How This Works </p>
<p>+ <a href=\"http://homepages.spa.umn.edu/~duvernoi/cutup.html\">History of Cut Up</a> </p>
<p>+ <a href=\"thedocument\">The Document</a> </p> 

</div>
<div id=\"container\">"
		
		footer = 
"</div></body>"
		
		
		#run the app
		[ 200, {"Content-Type" => "text/html"}, "#{header}<p class=\"center\"><b>#{title}</b></p> #{arr} #{footer}" ]
	end
end