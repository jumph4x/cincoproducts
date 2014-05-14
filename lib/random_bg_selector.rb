class RandomBgSelector
  def absolute_path
    "http://cachemonet.com/#{random_path}"
  end

  def random_path
    json[rand(json.size - 1)]
  end

  def json
    ActiveSupport::JSON.decode(File.open('bg.json'))
  end
end
