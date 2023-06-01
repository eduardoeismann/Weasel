require 'find'

classes = Array.new

Find.find('./sample') do |findThem|
  case
    when File.file?(findThem) then 
      puts "Reading file:  #{findThem}"

      File.open(findThem, 'r') do |readFile|
        while line = readFile.gets
          if line.include? "class=\""
            startClasses = line.split("class=\"")[1]

            # UNTIL HERE

            # IF THE LINE HAS A CLASS DECLARATION, THEN
            # WILL STORE THE TEXT OF THIS LINE FROM THE
            # CLASS QUOTE OPENING

            # EXAMPLE:
            # ENTIRE LINE: <h1 class="main_title">Page Sample</h1>
            # SUBSTNG LINE: main_title">Page Sample</h1>


            # NEXT STEPS
            # GET EACH CLASS THAT IS INSIDE THE DECLARATION
            # AND STORE THEM IN AN ARRAY ( classes ) <- ARRAY WAS DECLARED ABOVE

            puts line
          end
        end
      end

      puts "\n"

    when File.directory?(findThem) then 
      puts "It is a Directory."
    else "?"
  end
end
