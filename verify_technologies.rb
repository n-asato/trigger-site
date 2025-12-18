# Check migration
puts "Checking Work schema..."
columns = Work.columns_hash
if columns['technologies'].type == :json
  puts "Technologies column is JSON: OK"
else
  puts "Technologies column is #{columns['technologies'].type}: FAIL"
end

# Check existing data (mock check if any exists)
puts "Checking existing data..."
Work.all.each do |w|
  puts "Work #{w.id}: #{w.technologies.inspect} (#{w.technologies.class})"
end

# Test merging logic
puts "Testing logic..."
w = Work.new
w.technologies = ["Ruby"]
new_tech_str = "Rails, PostgreSQL"
added_techs = new_tech_str.split(',').map(&:strip).reject(&:blank?)
merged = (w.technologies + added_techs).uniq
puts "Merged: #{merged.inspect}"
if merged.sort == ["PostgreSQL", "Rails", "Ruby"]
  puts "Merge logic: OK"
else
  puts "Merge logic: FAIL"
end
