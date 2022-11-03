require 'csv'

class EventManager

    attr_accessor :file_name

    # Initialize the file name
    def initialize(file_name = "event_attendees.csv")
        puts "Starting Event Manager Program..."
        @file_name = file_name
        @lines
        @contents
    end

    # Loads file into one long string 
    def load_file()
        if File.exist?(@file_name)# Check if the file exists
            @contents = File.read(@file_name)
            puts "File Loaded..."
            return @contents
        else
            puts "Error Loading file: " + @file_name
            return
        end
    end

    # Loads the file into an array of strings for each line
    def load_file_lines()
        if File.exist?(@file_name)# Check if the file exists
            @lines = File.readlines(@file_name) # Puts each line in file into an array
            puts "File Lines Loaded..."
            return @lines
        else
            puts "Error Loading file: " + @file_name
            return
        end
    end

    def print_file_lines()
        @lines.each do |line|
            puts line
        end
    end

    def get_name_and_zips()
        name_and_zips = Array.new(Array.new) # TODO
        @lines.each_with_index do |line, i|
            column = line.split(",") # Split Line
            #Check to see if on header line
            if i != 0 # Avoid printing the header
                name = column[2]
                zip = column[9]
            end

            # Clean values
            clean_name = clean_name(name)
            clean_zip = clean_zip(zip)
            # Add to array
            name_and_zips.push([clean_name, clean_zip])
        end
        return name_and_zips
    end

    def print_names_and_zips(name_and_zips)
        for val in name_and_zips do
            puts "#{val[0]} ---> #{val[1]}"
        end
    end

    def clean_name(name)
        name = "Missing Name" if name == "" or name == nil
        return name
    end

    def clean_zip(zip)
        zip = "00000" if zip == nil or zip == ""
        zip.rjust(5, '0') if zip.length < 5
        zip[0..4] if zip.length > 5
        return zip

    end

    def print_column_from_lines(index=0)
        @lines.each_with_index do |line, i|
            column = line.split(",")
            if i != 0 # Avoid printing the header
                value = column[index]
                puts value
            end
        end
    end

    # Using the CSV Library * Make sure to include [require 'csv']

    # Load a file and print the specified row
    def load_csv_file_and_print_row(index=0)
        contents = CSV.open(@file_name, headers: true) # Load file. States that file has headers
        contents.each do |row|
            name = row[index]
            puts name
        end
    end

    # Load a file and print the specified row by Symbol
    def load_csv_file_and_print_row_using_token(token)
        contents = CSV.open(
            'event_attendees.csv',
            headers: true,
            header_converters: :symbol # turns each row header into a symbow so we can access it
        )
        contents.each do |row|
            name = row[token]
            puts name
        end
    end
end



file_name = "event_attendees.csv" # Reads from whichever directory were on. If this file isnt int the current directory, then it needs to be specified
em = EventManager.new(file_name)

em.load_file_lines
values = em.get_name_and_zips
# puts values
em.print_names_and_zips(values)
# em.print_column_from_lines(2)
#em.load_csv_file_and_print_row_using_token(:first_name)




