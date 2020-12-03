class Integer
  def divisor_list
    devisors = [1]
    2.upto(self/2) do |i|
      devisors << i if self%i == 0
    end
    devisors << self
    return devisors
  end
end