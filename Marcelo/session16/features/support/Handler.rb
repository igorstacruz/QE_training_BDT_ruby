


def singleton_example
	$singleton_example ||= Handler.new
end
class Handler
	attr_accessor :hash1, :hash2

	def initialize
		$hash1 = Hash.new
		$hash2 = Hash.new
	end

	def build_hashes name, id, total_price
		$hash1.store(name, id)
		$hash2.store(id, total_price)
		return $hash1, $hash2
	end
end

Before('@outline') do
	puts "I am running an outline scenario"
	puts "SEARCHING"
end

Before('@normal') do
	puts "I am running a normal scenario"
end

Before('@outline, @normal') do
	puts "CUSTOMER SEARCH TEXT"
end

After('@outline') do
	puts "I finished running the outline scenario"
end

After('@outline') do
	puts "I finished running a normal scenario"
end
