class DuplicateShojo < Exception
end

class Country < Struct.new(:name, :shojos)
  def validate!
    shojos.each do |s|
      next if s.empty?
      if shojos.count(s) != 1
        raise DuplicateShojo.new(
          "%s duplicates in %s" % [s.name, name])
      end
    end
  end
end
