class Doc
	def call(env)
		doc = []
		File.open('thedocument.xml', 'r') do |f|
			while line = f.gets
			doc << line
			doc.to_s
			end
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
		[ 200, {"Content-Type" => "text/html"}, "#{header} #{doc} #{footer}" ]
	end
end