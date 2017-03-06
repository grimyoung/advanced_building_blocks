def bubble_sort(array)
	sorted = false
	numsort = 0
	until sorted do
		for i in (0..array.length-2)
			if array[i] > array[i+1]
				array[i], array[i+1] = array[i+1], array[i]
				numsort += 1
			end
		end
		if numsort == 0
			sorted = true
		end
		numsort = 0
	end
	return array
end

test = [4,3,78,2,0,2]
p bubble_sort(test)