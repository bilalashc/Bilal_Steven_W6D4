# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do 
    puts 'Destroying Tables'
    Cat.destroy_all

    puts 'Resetting ID Sequences'
    %w(cats).each do |table|
        ApplicationRecord.connection.reset_pk_sequence!(table)
      end
    
    puts 'Creating Seed Data'
    cat1 = Cat.create(:birth_date => '2001/01/01', :color => 'black', :name => 'Chester', :sex => 'F', :description => '')
    cat2 = Cat.new(birth_date: '2001/01/01', color: 'white', name: 'Leo', sex: 'M').save

end




