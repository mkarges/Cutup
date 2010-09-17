class Html
	attr_reader :form, :head, :left, :cutup
	
	def head
	puts
"<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
<html xmlns=\"http://www.w3.org/1999/xhtml\">
<head>
<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />
<title>Cut Up</title>
<link rel=\"stylesheet\" type=\"text/css\" href=\"/stylesheets/cut.css\" />
<script language=\"JavaScript\" type=\"text/JavaScript\" src=\"\"></script>
</head>"
	end
	
	def form
	puts
"<div id=\"container\">	
<p class=\"quote\">\"If you have a  prerecorded universe in which everything is already prerecorded, the only thing that is not prerecorded 
are the prerecordings themselves. So with my cut ups I was attempting to tamper with the basic prerecordings and I think 
I have succeeded to some modest extent.\"
-<i>William S. Burroughs</i>
<p><form name=\"input\" action=\"\" method=\"post\">
<textarea name=\"cut\" cols=\"60\" rows=\"10\" /></textarea><br />
<p>Cut This Up: </p>
<input type=\"submit\" value=\"submit\" />
</form></p>
</div>"
	end
	
	def left
	puts
"<div id=\"left\">
<p>+ <a href=\"http://homepages.spa.umn.edu/~duvernoi/cutup.html\">History of Cut Up</a> </p>
<p>+ <a href=\"thedocument\">The Document</a> </p> 
<p>+ Links </p>
</div>"
	end
	
	def cutup
	puts
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
</form></p>"
	end
end