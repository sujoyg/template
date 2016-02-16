class Hash
  def stringify_keys_deep
    output = YAML.load self.to_yaml
    output.each_pair do |k, v|
      if v.is_a? Hash
        output[k] = v.stringify_keys_deep
      end
    end

    output.stringify_keys
  end
end