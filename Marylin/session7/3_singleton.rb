class Base
	def initialize
		@value=0
	end
	def any
		@value=10
	end
	def some
		@value
	end
end

def singleton_example
	@singleton_example ||= Base.new
end

p singleton_example.any
p singleton_example.object_id
p singleton_example.some
p singleton_example.object_id

p Base.new.object_id
p Base.new.some

p singleton_example.some
p singleton_example.object_id
