# generate 5 random number between 1 - 5.
# then cut the text up into chunks of words corresponding to the 5 random numbers


class Random...


a = rand(5)
b = rand(5) 
c = rand(5) 
d = rand(5) 
e = rand(5) 


#next step is to pull out the chunks of words and to store them temporarily in memory.
#then reorder them. 
#return response to submitter


text = env["rack.request.form_hash"].to_s.slice!(3...1003) }#request the text from form hash, assign to "text" variable

entry = text.split(/ /)

num = entry.count

class Array
  def shuffle!
    size.downto(1) { |n| push delete_at(rand(n)) }
    self
  end
end

--- read file
File.open('thedocument.rtf', 'r') do |f|
	while line = f.gets
	doc += "#{line}"
	end
end


cgi = CGI.new("html4")
session = CGI::Session.new(cgi, 'new_session' => true)
session['entry'] = "gevalt!"
session.close
			
-----


---- shuffle with new text
...
save output as 'document'


--- write new file
File.open('FILE_NAME', 'w') do |f2|
  f2.puts document	
end



use squeeze method to eliminate white space?
