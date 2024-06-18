
arr = [1,'a',23,'b',35,"abc",4]

a = arr.map() do |ele|
    if ele.is_a?(Integer)
                ele * 2
    end
end     

puts a