arr1 = [1,2,3]
arr2=[4,5,6]
s = arr1.size

for ele in arr2 do 
    arr1[s] = ele
    s +=1
end

arr1.each do |ele|
   puts ele
end