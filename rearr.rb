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