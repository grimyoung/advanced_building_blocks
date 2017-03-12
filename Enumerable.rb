module Enumerable
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

	# def my_map()
	# 	array = []
	# 	self.my_each do |x|
	# 		array << yield(x)
	# 	end
	# 	return array
	# end

	#note to self, &block does not count as an argument, it is only there to convert
	#the block into a proc
	def my_map(proc = nil, &block)
		array = []
		if proc != nil && proc.is_a?(Proc)
			self.my_each do |x|
				array << proc.call(x)
			end
		elsif block_given?
			self.my_each do|x|
				array << yield(x)
			end
		end
		return array
	end

	#todo include the case where a symbol operation is passed in
	def my_inject(arg = self[0])
		memo = arg
		self.my_each do |x|
			memo = yield(memo,x)
		end
		return memo
	end

	def self.multiply_els(array)
		return array.my_inject{|acc,x| acc*x}
	end

	#
	p [1,2,3].my_map {|x| x*2}
	p [1,2,"a"].my_map {|x| x*2}
	test = Proc.new do |x|
		x*x
	end
	p [1,2,2].my_map(test)
	p [3,4,5].my_map(test){|x| x*10}

end