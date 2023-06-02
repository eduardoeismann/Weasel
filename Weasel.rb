require 'find'

allClasses = Array.new

# FIND ALL CLASSES
Find.find('./sample') do |findClasses|
  case
    when File.file?(findClasses) then 

      File.open(findClasses, 'r') do |readFile|

        if findClasses.end_with?(".html", "xhtml")
          puts "Reading file:  #{findClasses}"

          while line = readFile.gets
            if line.include? "class=\""
              startClasses = line.split("class=\"")[1]
              startClasses = startClasses.split("\"")[0]
              allClasses << startClasses.split(" ")
            end
          end
        end
      end
    #
  end
end

puts "\nClasses Found: "
puts allClasses
