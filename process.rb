class Pro
	def call(env)
		temp = DB[:temp]	
	    unless temp.empty?
			document = DB[:document]
			doc = document.map(:master).last
			#i.e. SELECT * FROM document ORDER BY id DESC LIMIT 1
			#Will output a string, so need to convert to array
	
			arr = doc.split(/ /)

			t_arr = []	
			t_arr = temp.map(:entry)
		#This should be an array not a string so no reason to convert		

		#test to see if temp file is empty; if not, add contents of temp file to master doc
			arr += t_arr 	
			
			#send thedocument with new text to shuffle method
			n = arr.count
			arr.to_s
			entry = Rearr.new(arr, n)
			entry.shuffle!
			
			#create a title
			t = []
			t = entry.slice(0)	
			title = t.join(" ")
			
			#reassign arr variable to new shuffled text
			arr = entry.join(" ")
			
			document.insert(:master => arr, :title => title)		
			
			#empty out temp file
			temp.delete						
			
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
		else
			#if not submitted thru form, redirect to the document
			[ 302, {'Content-Type' => 'text/html', 'Location' => '/thedocument'}, [] ]
		end
	
	end
end