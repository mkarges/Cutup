class CutUp
	def call(env)
		request = Rack::Request.new(env)
		body =  
			unless request['cut'].nil? || request['cut'].empty? 
			# if the form paramater is passed via post, the hash is converted 'to string' and the 3-digit index is 'sliced' off; 
			# max of 1000 characters allowed; all passed to body array
			text = env["rack.request.form_hash"].to_s.slice!(3...1003)		
			new_text = text.split(/ /)
			n = new_text.count
			
			entry = Rearr.new(new_text, n)

			entry.shuffle!
			
			temp = DB[:temp]
			
			#need to make sure to empty temp in case of resubmit
			temp.delete
			
			temp.insert(:entry => entry.join(" "))
			
			#File.open('temp.xml', 'w+') do |t|
			#	t.puts entry
			#end
													
"<body>
<div id=\"container\">		
<p class=\"quote\">\"If you have a  prerecorded universe in which everything is already prerecorded, the only thing that is not prerecorded 
are the prerecordings themselves. So with my cut ups I was attempting to tamper with the basic prerecordings and I think 
I have succeeded to some modest extent.\"
-<i>William S. Burroughs</i>
</p>
<p><form name=\"input\" action=\"\" method=\"post\">
<textarea name=\"cut\" cols=\"60\" rows=\"10\" /></textarea><br />
<p>Cut This Up: </p>
<input type=\"submit\" value=\"submit\" />
</form></p>

<p> #{entry.join(" ")} </p>

<p><form name=\"commit\" action=\"process\" method=\"post\">
<input type=\"submit\" value=\"Commit to The Document\" />
</container>
</div>
<div id=\"left\">
<p>+ <a href=\"../\">Home</a> </p>
<p>+ How This Works </p>
<p>+ <a href=\"http://homepages.spa.umn.edu/~duvernoi/cutup.html\">History of Cut Up</a> </p>
<p>+ <a href=\"thedocument\">The Document</a> </p> 
</div>
</body>
</html>"
			else
"<body>
<div id=\"container\">	
<p class=\"quote\">\"If you have a  prerecorded universe in which everything is already prerecorded, the only thing that is not prerecorded 
are the prerecordings themselves. So with my cut ups I was attempting to tamper with the basic prerecordings and I think 
I have succeeded to some modest extent.\"
-<i>William S. Burroughs</i>
<p><form name=\"input\" action=\"\" method=\"post\">
<textarea name=\"cut\" cols=\"60\" rows=\"10\" onclick=\"document.input.cut.value='';\">
Enter text to be cutup here</textarea>

<br />
<p>Cut This Up: </p>
<input type=\"submit\" value=\"submit\" />
</form></p>
</div>
<div id=\"left\">
<p>+ <a href=\"../\">Home</a> </p>
<p>+ How This Works </p>
<p>+ <a href=\"http://homepages.spa.umn.edu/~duvernoi/cutup.html\">History of Cut Up</a> </p>
<p>+ <a href=\"thedocument\">The Document</a> </p> 
</div>
</body>
</html>"		      
			end
			
		header = 
"<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\">
<head>
<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />
<title>Cut Up</title>
<link rel=\"stylesheet\" type=\"text/css\" href=\"/stylesheets/cut.css\" />
<script language=\"JavaScript\" type=\"text/JavaScript\" src=\"\"></script>
</head>"
		
		[ 200, {"Content-Type" => "text/html"}, [header + body] ]
	end
end




	