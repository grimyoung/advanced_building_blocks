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

	def my_all?
		self.my_each do |x|
			if not yield(x)
				return false
			end
		end
		return true
	end

	def my_any?
		self.my_each do |x|
			if yield(x)
				return true
			end
		end
		return false
	end

	def my_none?
		self.my_each do |x|
			if yield(x)
				return false
			end
		end
		return true
	end

	#
	p [1,2,3].my_none? {|x| x.is_a? Integer}
	p [1,2,'a'].my_none? {|x| x.is_a? Integer}
	p [nil,'a',''].my_none? {|x| x.is_a? Integer}

end