# require "truth_table/version"

class TruthTable
  def initialize(pow, &block)
    @code = block
    @pow = pow
  end

  def to_s
    calculate!
    self
  end

private

  attr_reader :code, :pow

  def calculate!
    0.upto(2 ** pow - 1) do |i|
      args = ("%0#{pow}d" % i.to_s(2)).split('').map { |s| s == '1' }
      p args
      puts "#{args.join("\t")}\t#{code.call(args)}"
    end
  end
end
