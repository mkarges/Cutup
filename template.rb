class Display
  def header
    "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">
    <html xmlns=\"http://www.w3.org/1999/xhtml\">
    <head>
    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />
    <title>Cut Up</title>
    <link rel=\"stylesheet\" type=\"text/css\" href=\"/stylesheets/cut.css\" />
    <script language=\"JavaScript\" type=\"text/JavaScript\" src=\"\"></script>
    </head>
    <body>
    <div id=\"title\">
    <a class=\"none\" href=\"../\">The Cut-up Method</a>
    </div>
  	<div id=\"headBand\">
  		<div id=\"headItem\"><a href=\"../\">HOME</a></div>
  		<div id=\"headItem\"><a href=\"how\">HOW THIS WORKS</a></div>
  		<div id=\"headItem\"><a href=\"history_of_cutup\">HISTORY OF CUT-UP</a></div>
  		<div id=\"headItem\"><a href=\"thedocument\">THE DOCUMENT</a></div>
  	</div>
    	<div id=\"container\">"

  end
  
  def footer    
    		"</div>          
      </body>
    </html>"
  end
  
  def html(entry=[], f ="none")
    			"#{ self.header }
    			<div id=\"image_left\"><img src=\"images/typewriter.jpg\">
    			</div>
    			<div id=\"quote\">
    			    <p> \"If you have a  prerecorded universe in which everything is already prerecorded, the only thing that is not prerecorded 
          			are the prerecordings themselves. So with my cut-ups I was attempting to tamper with the basic prerecordings and I think 
          			I have succeeded to some modest extent.\"
          			-<i>William S. Burroughs</i>
              </p>    
          </div>
    			<div id=\"cutup\">
    			<p><form name=\"input\" action=\"\" method=\"post\">
    			<textarea name=\"cut\" cols=\"49\" rows=\"11\" onclick=\"document.input.cut.value='';\">Enter text to be cut-up here</textarea>
    			<br />
    				<p>	<input type=\"submit\" value=\"Cut This Up\" /></p>					
    				</form></p>
    			<p> #{ entry.join(" ") } </p>
    			<p> #{ submit_form(f) } </p>	
    			</div>	
    			#{ self.footer }"
  end   
  
  def submit_form(f)
    if f == "form"
  		"<form name=\"commit\" action=\"process\" method=\"post\">
  		<input type=\"submit\" value=\"Commit to The Document\" />
  		</form> <br />"
	  else
	    ""
	  end    
  end
  
  def doc_html(title,doc)
   	"#{ self.header }
    <p class=\"center\"><b>#{ title }</b></p>
    <p> #{ doc } </p>	
    #{ self.footer }"
  end
end


