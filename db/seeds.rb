# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# seed some tables
Publisher.create()
Character.create()

# this Walk function was found at https://stackoverflow.com/questions/15697983/directory-traversal-in-ruby 
# and tweaked as needed to work for my purposes
def walk(start)
  Dir.foreach(start) do |x|
    path = File.join(start, x)
    if x.match(/^(\..*)$/)
      next
    elsif File.directory?(path)
      walk(path)
    else
      if m = x.match(/^([\sA-Za-z\-!',\(\)]*)\s(\d{2,3}).*\.([A-Za-z0-9]*)$/)
        title = m[1]
        issue = m[2]
        ext = m[3]
      elsif
        title = x
        ext = File.extname(path)
      end
      size = File.size(path)
      path = path[7..-1] #cut off the "public/" part of the path
      if ext == "cbr" || ext == "cbz"
        title_id = Title.find_or_create_by!(name: title).id
        if !Comic.exists?(full_path: path)
          Comic.create(full_path: path, title_id: title_id, issue_number: issue, extension: ext, size: size)
        end
      end
    end
  end
end

# read in a list of publishers
def get_publishers
  File.readlines('publishers.data').each do |line|
    line = line.chomp
    Publisher.create(name: line)
  end
end

# read in a list of characters
def get_characters
  File.readlines('characters.data').each do |line|
    d = line.split(',').map(&:strip)
    Character.create(name: d[0], publisher: d[1])
  end
end

def set_character_publisher
  Title.all.each do |title|
    Character.all.each do |ch|
      if title.name.include? ch.name
        pub_id = 1
        if Publisher.find_by(name: ch.publisher) != nil
          pub_id = Publisher.find_by(name: ch.publisher).id
        end
        title.update(character_id: ch.id, publisher_id: pub_id)
      end
    end
  end
end

get_publishers()
get_characters()
walk("public/COMICS/")
set_character_publisher()
