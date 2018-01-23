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
  resultsFile = File.new("results.txt", "w")
  data = File.readlines("list.txt")
  data.map!{|x| x.to_i}

  data.each_index { |indx| 
    valueX = data[indx].to_i
    valueY = data.size.eql?(indx) ? data.first.to_i : data[indx + 1].to_i 
    valueZ = (valueX + valueY) * -1

    if data.include?(valueZ) then
      resultsFile.puts "#{valueX}, #{valueY}, #{valueZ}"
      i += 1
    end
  }

  resultsFile.puts "The total of posiible combination is #{i}"
  resultsFile.close
end

createFileWithRandomNumbers(ARGV[0].to_i)
getResults()
puts "Completed!"
