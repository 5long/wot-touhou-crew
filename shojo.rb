class Shojo < Struct.new(:name)
  RES_ROOT = File.expand_path("../res", __FILE__)

  def self.new(name)
    if name.nil?
      EmptyShojo.new
    else
      super
    end
  end

  def pic_big
    File.join(RES_ROOT, name, 'big.png')
  end

  def pic_small
    File.join(RES_ROOT, name, 'small.png')
  end

  def pic_barracks
    pic_small
  end

  def empty?
    false
  end
end

class EmptyPic < Exception; end

class EmptyShojo
  def initialize
  end

  def name
    EMPTY
  end

  def empty?
    true
  end

  def pic_big
    pic_is_empty
  end

  def pic_small
    pic_is_empty
  end

  def pic_barracks
    pic_is_empty
  end

  def pic_is_empty
    raise EmptyPic
  end
end
