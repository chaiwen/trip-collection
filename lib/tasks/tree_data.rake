# rake file to import tree data csv
namespace :tree_data do
	desc "HW4: Import public tree data from csv file"
	task :import_trees, [:file_name] => :environment do |t, args|
		file_name = args[:file_name] || '1995_Street_Tree_Census_Short.csv'
		#file_name = './hw4_dataset/1995_Street_Tree_Census_Short.csv'
		puts "read in CSV from #{file_name}..."
		#puts "Args were: #{args}"

		#db = Mongoid::Sessions.default

		require 'csv'

		CSV.foreach(file_name, :headers => true, :col_sep => ',') do |row|
			# already in the format of an array!
			# p row

			t = Tree.new()

			t.species = row['Species'].strip
			t.species_common = row['Spc_Common'].strip
			t.species_latin = row['Spc_Latin'].strip
			t.diameter = row['Diameter'].strip
			t.condition = row['Condition'].strip

			t.addr_num = row['House_Number'].strip
			t.addr_st = row['Street'].strip
			t.addr_zip = row['Zip_New'].strip
			t.neighborhood = row['Borough'].strip
			t.latitude = row['Latitude'].strip
			t.longitude = row['Longitude'].strip

			#p t

			t.save()

		end

		#collection = db[:tree]
		#doc = collection.find(species: 'ACPL').first

		#p doc

	end
end
