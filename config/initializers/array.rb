class Array
  def to_hash_using(attr)
    map = {}
    each do |entry|
      map[entry.send attr] = entry
    end

    map
  end
end