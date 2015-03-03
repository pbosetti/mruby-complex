class Numeric
  def to_c
    Complex(self)
  end
  
  def i
    Complex(0, self)
  end
  
  def real
    self
  end
end

class Complex < Numeric
  
  def self.polar(abs, arg = 0)
    return self.new(abs * Math::cos(arg), abs * Math::sin(arg))
  end
  
  def self.rect(real, imag=0)
    return self.new(real, imag)
  end
  class << self # Class aliases
    alias_method :rectangular, :rect
  end
  
  attr_reader :real, :imag
  def initialize(real = 0, imag=0)
    @real = real
    @imag = imag
  end
  
  def *(numeric)
    n = numeric.to_c
    Complex((@real * n.real - @imag * n.imag), (@real * n.imag + n.real * @imag))
  end
  
  def **(numeric)
    result = self
    (1...numeric).each do |i|
      result *= self
    end
    return result
  end
  
  def +(numeric)
    n = numeric.to_c
    Complex(@real + n.real, @imag + n.imag)
  end
  
  def -(numeric)
    n = numeric.to_c
    Complex(@real - n.real, @imag - n.imag)
  end
  
  def -@
    Complex(-@real, -@imag)
  end
  
  def /(numeric)
    q = numeric.to_c.abs2.to_f
    n = numeric.to_c
    a = (@real * n.real + @imag * n.imag) / q
    b = (@imag * n.real - @real * n.imag) / q
    Complex(a, b)
  end
  alias quo /
  
  def ==(obj)
    if obj.kind_of? Numeric
      return (@real == obj.real) and (@imag == obj.imag)
    else
      return false
    end
  end
  
  def abs
    return self.abs2 ** 0.5
  end
  
  def abs2
    @real ** 2 + @imag ** 2
  end
  
  def arg
    Math::atan2(@imag, @real)
  end
  alias phase arg
  alias angle arg
  
  def conj
    Complex(@real, -@imag)
  end
  alias conjugate conj
  
  def denominator
    raise RuntimeError, "Unimplemented Complex#denominator"
  end
  
  def fdiv(numeric)
    raise ArgumentError unless f.respond_to? :to_f
    n = numeric.to_f
    Complex(@real / n, @imag / n)
  end
  
  def imag=(f)
    raise ArgumentError unless f.kind_of? Numeric
    @imag = f
  end
  alias imaginary imag
  
  def numerator
    raise RuntimeError, "Unimplemented Complex#numerator"
  end
    
  def polar
    return [self.abs, self.phase]
  end
  
  def rationalize
    raise RuntimeError, "Unimplemented Complex#rationalize"
  end
  
  def real=(f)
    raise ArgumentError unless f.kind_of? Numeric
    @real = f
  end
  
  def real?
    return false
  end
  
  def rect
    return [@real, @imag]
  end
  alias rectangular rect
  
  def to_c
    self
  end
  
  def to_f
    raise RangeError unless @imag.kind_of? Integer
    return @real.to_f
  end
  
  def to_i
    raise RangeError unless @imag.kind_of? Integer
    return @real.to_i
  end
  
  def to_r
    raise RuntimeError, "Unimplemented Complex#to_r"
  end
  
  def to_s
    "(#{@real}#{@imag>=0?'+':''}#{@imag}i)"
  end
  
  def inspect
    self.to_s
  end
end

def Complex(real, imag=0)
  Complex.rect(real, imag)
end
