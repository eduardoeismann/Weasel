require "find"

allClasses = Array.new
usedClasses = Array.new

# FIND ALL CLASSES
Find.find("./sample") do |findClasses|
  case
    when File.file?(findClasses) then 

      File.open(findClasses, "r") do |readFile|

        if findClasses.end_with?(".html", "xhtml")
          while line = readFile.gets
            if line.include? "class=\""
              startClasses = line.split("class=\"")[1]
              startClasses = startClasses.split("\"")[0]
              startClasses = startClasses.split(" ")
              for thisClass in startClasses do
                allClasses << thisClass
              end
            end
          end
        end

      end
    #
  end
end

# SEARCH CLASSES IN STYLES FILES
Find.find("./sample") do |searchStyles|
  case
    when File.file?(searchStyles) then
      File.open(searchStyles, "r") do |readFile|
        if searchStyles.end_with?("css", "scss")
          while line = readFile.gets
            for thisClass in allClasses do
              if line.include?(thisClass)
                usedClasses << thisClass
              end
            end
          end

        end
      end
    #
  end
end

unusedClasses = allClasses - usedClasses

unusedClasses.length().times {
  |i| puts "Class [ #{unusedClasses[i]} ] is not being used."
}
