require "fiddle"
require "fiddle/import"

module RustPoint
  extend Fiddle::Importer

  dlload "./liblib.so"

  extern "Point* make_point(int, int)"
  extern "double get_distance(Point*, Point*)"
  extern "int loop_sum(int)"

  def self.rust_get_distance
    p1 = RustPoint::make_point(10, 10)
    p2 = RustPoint::make_point(20, 20)
    RustPoint::get_distance(p1, p2)
  end

  def self.rust_loop_sum
    RustPoint::loop_sum(500000000)
  end

  def self.ruby_loop_sum
    c =0
    (1...500000000).each do |i|
      c += i
    end
    return c
  end
end

require 'benchmark'

Benchmark.bm do |x|
  x.report("Rust lib:")   { RustPoint.rust_loop_sum }
  x.report("Ruby local:")   { RustPoint.ruby_loop_sum }
end
