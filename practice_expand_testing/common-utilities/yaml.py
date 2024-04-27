import yaml
import os
from robot.api.deco import keyword

class FileUtils:
    def normalize_path(path):
        if not os.path.isabs(path): # Check if the path is absolute
            path = os.path.join(os.getcwd(), path) # Get current work directory + relative path
        return os.path.normpath(path) # Return the path without .. or duplicated //

class YamlUtils:
    def load_yaml_file(self, path_file):
        file_path = FileUtils.normalize_path(path_file)
        with open(file_path, 'r') as file:
            return yaml.safe_load(file)

    def is_dict(self, data):
        return isinstance(data, dict)

    def _traverse_yaml(self, yaml_data, key_path):
        for key in key_path:
            value = yaml_data.get(key)
            if self.is_dict(value):
                yaml_data = value
                value = yaml_data.get(key)
            if yaml_data is None:
                raise KeyError(f"Key 'key' not found.")
        return value

    @keyword
    def get_yaml_value(self, file_path, key_path):
        file_path = FileUtils.normalize_path(file_path)
        yaml_data = self.load_yaml_file(file_path)
        print(yaml_data)
        value = self._traverse_yaml(yaml_data, key_path.split('.'))
        print(value)
        return value

    @keyword('convertYamlToDictionary')
    def load_yaml(self, yaml_string):
        try:
            return yaml.safe_load(yaml_string)
        except Exception as e:
            raise ValueError(f"Invalid YAML: {yaml_string}")

    @keyword
    def get_dictionary_key(self, dictionary):
        return dictionary.keys()

    @keyword
    def get_dictionary_value(self, dictionary, key):
        return dictionary.get(key)