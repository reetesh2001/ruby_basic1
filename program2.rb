arr = ['a', 'b', 'a', 'c', 'b', 'a', 'd', 'c']
map = Hash.new(0)

arr.each do |char|
    map[char] +=1
end

for key ,val in map do 
    puts "#{key} :: #{val} "
end

