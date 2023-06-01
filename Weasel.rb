require 'find'

Find.find('./sample') do |findThem|
  case
    when File.file?(findThem) then 
      puts "Reading file"

      File.open(findThem, 'r') do |readFile|
        while line = readFile.gets
          puts line
        end
      end

      puts "\n"

    when File.directory?(findThem) then 
      puts "It is a Directory."
    else "?"
  end
end
