require 'yaml'
require 'date'
require 'json'

def yaml2json(yaml_path, json_path)
  yaml = YAML.load_file(yaml_path, permitted_classes: [Date])

  File.open(json_path, 'w') do |file|
    JSON.dump(yaml, file)
  end
end

if __FILE__ == $PROGRAM_NAME
  yaml2json(ARGV[0], ARGV[1])
end
