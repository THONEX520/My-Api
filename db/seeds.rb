# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'csv'

# Clear existing data to avoid duplicates (optional, be cautious!)
Earthquake.delete_all

# Path to your CSV file
csv_file_path = Rails.root.join('db', 'earthquakes_data.csv')

# Read the CSV file and import the data
CSV.foreach(csv_file_path, headers: true) do |row|
  Earthquake.create!(
    location: row['location'],
    magnitude: row['magnitude'],
    date: row['date']
  )
end

puts "Successfully imported #{Earthquake.count} earthquakes."
