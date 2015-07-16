module Enumerable

	def my_each
		for i in 0...self.size
			yield(self[i])
		end
		self
	end

	def my_each_with_index
		for i in 0...self.size
			yield(self[i], i)
		end
		self
	end

	def my_select
		selected = []
		for i in 0...self.size
			selected << self[i] if yield(self[i])
		end
		selected
	end

	def my_all?
		if block_given?
			for i in 0...self.size
				return false unless yield(self[i])
			end
			true
		else
			for i in 0...self.size
				return false unless self[i]
			end
			true
		end
	end

	def my_any?
		if block_given?
			for i in 0...self.size
				return true if yield(self[i])
			end
			false
		else
			for i in 0...self.size
				return true if yield(self[i])
			end
			false
		end
	end

	def my_none?
		for i in 0...self.size
			return false if yield(self[i])
		end
		true
	end

	def my_count(*arg)
		return self.size unless block_given? || arg != []
		count = 0
		if block_given?
			for i in 0...self.size
				count += 1 if yield(self[i])
			end
			count
		else
			for i in 0...self.size
				count += 1 if self[i] == arg.first
			end
			count
		end
	end

	def my_map(proc)
		collection = []
		for i in 0...self.size
			collection << proc.call(self.to_a[i])
			collection << yield(self.to_a[i]) if block_given?
		end
		collection
	end

	def my_inject(number = nil)
		total = number ? number : self.to_a.first
		for i in 0...self.size
			total = yield(total, self.to_a[i])
		end
		total
	end
	
end

def multiply_els(numbers)
	numbers.my_inject { |product, n| product * n }
end

catproc = Proc.new { "cat" }
print (1..4).my_map(catproc) { "dog" }