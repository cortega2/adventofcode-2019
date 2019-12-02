def from_file(path)
  sum = 0
  File.open(path).each do | line |
    init_fuel = single_module(line.to_i)
		sum += fuel_for_fuel(init_fuel)
  end

  return sum
end

def single_module(mass)
  (mass.to_i / 3) - 2
end

def fuel_for_fuel(fuel)
  if fuel <= 0
    return 0
  end

  fuel + fuel_for_fuel(single_module(fuel))
end


input = ARGV[0]

gifts_fuel = from_file(input)
puts gifts_fuel



