require 'yaml'

module YAMLReader

  def self.read_data(file_name, property)
    file = YAML.load_file(file_name)
    data = file[property]
  end
end
