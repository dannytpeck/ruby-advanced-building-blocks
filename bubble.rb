def bubble_sort(n)
	(n.size-1).times do
		for i in 0...n.size-1
			if n[i] > n[i+1]
				n[i], n[i+1] = n[i+1], n[i] if n[i] > n[i+1]
			end
		end
	end
	n
end

print bubble_sort([4,3,78,2,0,2]) # => [0,2,2,3,4,78]

def bubble_sort_by(n)
	(n.size-1).times do
		for i in 0...n.size-1
			if yield(n[i], n[i+1]) > 0
				n[i], n[i+1] = n[i+1], n[i]
			end
		end	
	end
	n
end

print bubble_sort_by(["hi","hello","hey"]) { |left,right| left.length - right.length } # => ["hi", "hey", "hello"]