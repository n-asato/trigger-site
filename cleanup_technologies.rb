# Split existing slash-separated technologies
Work.find_each do |w|
  next if w.technologies.blank?
  
  # Flatten and split by slash if any element contains it
  new_techs = w.technologies.flat_map { |t| t.to_s.split('/') }.map(&:strip).reject(&:blank?).uniq
  
  if new_techs != w.technologies
    puts "Updating Work #{w.id}: #{w.technologies} -> #{new_techs}"
    w.update_columns(technologies: new_techs)
  end
end
puts "Done cleanup."
