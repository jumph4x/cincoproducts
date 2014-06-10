class RandomBgSelector
  def random_path
    files[rand(files.size - 1)]
  end

  def files
    @files ||= Dir["app/assets/images/banners/*"].map{|f| "/assets/#{f.split('/')[-2..-1].join('/')}" }
  end
end
