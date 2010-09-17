class Doc
	def call(env)
		doc = []
		File.open('thedocument.xml', 'r') do |f|
			while line = f.gets
			doc << line
			doc.to_s
			end
		end
	[200, {"Content-Type" => "text/html"}, doc ]
	end
end