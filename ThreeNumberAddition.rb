#!/usr/bin/ruby

def createFileWithRandomNumbers(numberOfElements)
  file = File.new("list.txt", "w")
  elements = Array.new(numberOfElements) { rand(-100...100) }
  elements.each do |x|
    file.puts x
  end
  file.close
end

def getResults()
  i = 0
  values = Hash.new

  resultsFile = File.new("results.txt", "w")
  data = File.open("list.txt","r")

  data.each_line do |line|
    key = line.to_i
    if values.has_key?(key) then
      values[key] += 1
    else
      values[key] = 1
    end
  end

  data.close
  values2 = values

  values.each_key do |valX| 
    valueX = valX.to_i
    values2.delete(valX)

    values2.each_key do |valY|
      valueY = valY.to_i
      valueZ = (valueX + valueY) * -1

      if values2.has_key?(valueZ) and values2[valueZ] > 1 then
        resultsFile.puts "#{valueX}, #{valueY}, #{valueZ}"
        i += 1
      end
    end
  end

  resultsFile.puts "The total of posiible combination is #{i}"
  resultsFile.close 

end

createFileWithRandomNumbers(ARGV[0].to_i)
getResults()
puts "Completed!"
