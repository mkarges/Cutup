#cut up the text entered by user or else display the home page
class Cut
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
			
			  #create record in temp table for new cutup text
  			temp.insert(:entry => entry.join(" "))

        #calls for html output, displaying the cutup text and form for submiting to thedocument
  			display = Display.new				
  			display.html(entry, "form")						
        
			else
			
			  #this will load home page
  			display = Display.new  
  			display.html()
    
			end		
		[ 200, {"Content-Type" => "text/html"}, [body] ]
	end
end


#take cutup text from user input out of temp table & mix it into The Document; 
#randomize The Document display and output new version
class Pro
	def call(env)
		temp = DB[:temp]	
	    unless temp.empty?
			document = DB[:document]
			doc = document.map(:master).last
			#i.e. SELECT * FROM document ORDER BY id DESC LIMIT 1
			#Will output a string, so need to convert to array
	    
			arr = doc.split(/ /)
			
			#add a line break (via paragraph tags) to thedocument if more than 150 chars submitted.
			if temp.to_s.length > 150
	      	arr << ['</p><p>']
      end

			t_arr = []	
			t_arr = temp.map(:entry)
			#This should be an array not a string so no reason to convert		

			arr += t_arr 	
			
			#send thedocument with new text to shuffle method
			n = arr.count
			arr.to_s
			entry = Rearr.new(arr, n)
			entry.shuffle!
			
			#create a title
			title = []
			title = entry.slice!(0).join(" ")
			
			#reassign arr variable to new shuffled text
			arr = entry.join(" ")
			
			document.insert(:master => arr, :title => title)		
			
			#empty out temp file
			temp.delete						
			
			display = Display.new
			body = display.doc_html(title,arr)
			
			#run the app
			[ 200, {"Content-Type" => "text/html"}, [body] ]
		else
			#if not submitted thru form, redirect to the document
			[ 302, {'Content-Type' => 'text/html', 'Location' => '/thedocument'}, [] ]
		end	
	end
end


#generate The Document for viewing only
class Doc
	def call(env)
	  
  	document = DB[:document]
  	
  	#fetch title & doc records from most recent db entry
		doc = document.map(:master).last
		title = document.map(:title).last
						
		#call html & styling
		display = Display.new
		body = display.doc_html(title,doc)
		
		#run the app
    [ 200, {"Content-Type" => "text/html"}, [body] ]
	end
end

#generate How page 
class How
    def call(env)
      text = ""
      File.open("docs/how.txt", "r") do |r|
        while (line = r.gets) 
          text << line
        end
      end
      display = Display.new
      body = display.doc_html("",text)
      
      [200, {"Content-Type" => "text/html"}, [body] ]
        
    end
end

#generate History page 
class His
    def call(env)
      text = ""
      File.open("docs/history_of_cutup.txt", "r") do |r|
        while (line = r.gets) 
          if line.strip.empty?
            line = '</p><p>'
          end
          text += line
        end
      end
      display = Display.new
      body = display.doc_html("",text)
      
      [200, {"Content-Type" => "text/html"}, [body] ]
        
    end
end


class Rearr
	def self.new(t, n)
		entry = []
			if n > 1000 
				#this would be thedocument
				while n > 0 do
					q = rand(10)
					arr = t.slice!(0..q)
					entry << arr
					n -= q
				end
			else 
				#this is the cutup engine
				while n > 0 do
					q = rand(4)
					arr = t.slice!(0..q)
					entry << arr
					n -= q
				end
			end
			#clear out empty/nil elements at the end of array
		entry.compact.reject { |s| s.nil? || s.empty? }
	end
end


class Array
  def shuffle!
    size.downto(1) { |n| push delete_at(rand(n)) }
    self
  end
end
