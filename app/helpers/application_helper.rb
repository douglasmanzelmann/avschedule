module ApplicationHelper

  def sort_by_begin_time(array)
	return array if array.length <= 1

	pivot = array.shift
	less, greater = [], []

	array.each do |x| 
		if x.begin < pivot.begin
			less << x
		elsif x.begin >= pivot.begin
			greater << x
		end
	end

	return sort_by_begin_time(less) + [pivot] + sort_by_begin_time(greater)
  end
end
