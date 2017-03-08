module Enumerable
	#currently works if the object the method is called on is an array
	#need to modify the methods to work if the object is a hash
	def my_each
		i = 0
		while i < self.size
			yield(self[i])
			i+=1
		end
		return self
	end

	def my_each_with_index
		i = 0
		while i < self.size
			yield([self[i],i])
			i+=1
		end
		return self
	end

	def my_select
		array = []
		self.my_each do |x|
			array << x if yield(x)
		end
		return array
	end

	

end