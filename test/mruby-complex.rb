assert("Complex::rect") do
  c = Complex.rect(1,1)
  assert_float(c.real, 1)
end

assert("Complex::rect") do
  c = Complex.rect(1,1)
  assert_float(c.imag, 1)
end

assert("Complex::polar") do
  c = Complex.polar(1, Math::PI/4.0)
  assert_float(c.abs, 1)
end

assert("Complex::polar") do
  c = Complex.polar(1, Math::PI/4.0)
  assert_float(c.arg, Math::PI/4.0)
end

assert("Complex#*") do
  assert_float((2.i * 2.i).to_f, -4)
end

assert("Complex#/") do
  assert_equal((1.i / 2.i), 0.5)
end

assert("Complex#conj") do
  assert_equal(2.i.conj, -2.i.conj)
end