class Rearr
	def self.new(t, n)
		entry = []
			while n > 0 do
				q = rand(4)
				arr = t.slice!(0..q)
				entry << arr
				n -= q
			end
		entry
	end
end