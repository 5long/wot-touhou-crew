class Shojo < Struct.new(:name)
  RES_ROOT = File.expand_path("../res", __FILE__)
  def pic_big
    File.join(RES_ROOT, name, 'big.png')
  end

  def pic_small
    File.join(RES_ROOT, name, 'small.png')
  end

  def pic_barracks
    pic_small
  end
end
