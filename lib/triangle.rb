class Triangle
  attr_accessor :kind, :s1, :s2, :s3 #:equalateral, :isosceles, :scalene

  def initialize(side1, side2, side3)
    @s1 = side1
    @s2 = side2
    @s3 = side3
  end

  def kind
    sides = [s1, s2, s3]
    if sides.any? {|side| side <= 0 }
      raise TriangleError
    elsif sides.any? {|side| (side >= sides.reduce(:+) - side) }
      raise TriangleError
    elsif sides.uniq.count == 1
      :equilateral
    elsif sides.uniq.count == 2
      :isosceles
    elsif sides.uniq.count == 3
      :scalene
    end
  end

end

class TriangleError < StandardError
  puts "Not an actual triangle"
end
