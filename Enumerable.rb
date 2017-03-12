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

	def my_count(arg = false)
		num = 0
		if block_given? && !arg
			self.my_each do |x|
				if yield(x)
					num +=1
				end
			end
		elsif arg
			self.my_each do |x|
				if arg == x
					num += 1
				end
			end
		else
			self.my_each do |x|
				num+=1
			end
		end
		return num
	end

	def my_map
		array = []
		self.my_each do |x|
			array << yield(x)
		end
		return array
	end

	def my_inject(arg = self[0])
		memo = arg
		self.my_each do |memo,x|
			memo = yield(memo,x)
		end
		return memo
	end

	def mutliply_els

	end

	#
	p [1,2,3].my_map {|x| x*2}
	#p [1,2,'a'].my_count {|x| x.is_a? Integer}
	#p [1,2,2].my_count(2)

end