require 'yaml'
require 'date'

def capitialize_with_spaces(key)
  key.gsub('_', ' ').capitalize
end

def yaml2stdout(yaml_path)
  data = YAML.load_file(yaml_path, permitted_classes: [Date])

  data["resume"].tap do |resume|
    # Basic profile info
    %w[name email website summary].each do |key|
      puts "#{key.capitalize}: #{resume[key]}"
    end

    # Cover letter
    "cover_letter".tap do |key|
      puts "#{capitialize_with_spaces(key)}: #{resume[key]}"
    end

    # General skills
    puts "\nSkills:"
    resume['skills_by_categories'].each do |skills_by_category|
      category = skills_by_category['category']
      skills = skills_by_category['skills']

      puts "  #{category}: #{skills.join(', ')}"
    end

    # Experiences
    puts "\nExperiences:"
    resume['experiences'].each do |experience|
      %w[company title start_date end_date description].each do |key|
        puts "  #{capitialize_with_spaces(key)}: #{experience[key]}"
      end

      "skills".tap do |key|
        puts "  #{capitialize_with_spaces(key)}: #{experience[key].join(', ')}"
      end
      puts
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  yaml2stdout(ARGV[0])
end
