namespace :import do
    desc "Import earthquakes from CSV"
    task earthquakes: :environment do
      require 'csv'
  
      file_path = Rails.root.join('db', 'earthquakes_data.csv')
      
      
      unless File.exist?(file_path)
        puts "CSV file not found"
        next
      end
  
      
      CSV.foreach(file_path, headers: true) do |row|
        Earthquake.create!(
          date: row['date'],
          location: row['location'],
          magnitude: row['magnitude'],
          depth: row['depth']
        )
      end
  
      puts "Earthquakes imported successfully!"
    end
  end
  