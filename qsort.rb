def qsort(array)
	return array if array.length <= 1

	pivot = array.shift
	less, greater = [], []

	array.each do |x| 
		if x < pivot
			less << x
		elsif x >= pivot 
			greater << x
		end
	end
	print "less: #{less}"
	print "greater: #{greater}"

	return qsort(less) + [pivot] + qsort(greater)
end


array = [5, 3, 1, 6, 10, 24, 0, 14, 100, 1, 4, 3, 500, 499]

puts "qsort: #{qsort(array)}"