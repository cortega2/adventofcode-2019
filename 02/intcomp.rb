def do_next(state)
  # do instruction
  case state[:inst][state[:idx]]
  when 1
   opp(:+, state)
  when 2
   opp(:*, state)
  when 99
   # No Op
  else
    # we dont have a valid instruction so force quit
    state[:inst][state[:idx]] = 99
  end
end

def opp(op, state)
  pointer = state[:idx]
  x_pos = state[:inst][pointer + 1]
  y_pos = state[:inst][pointer + 2]
  z_pos = state[:inst][pointer + 3]

  state[:inst][z_pos] = state[:inst][x_pos].send(op, state[:inst][y_pos])
  state[:idx] = pointer + 4
end

def run(state)
  while state[:inst][state[:idx] ] != 99 do
    do_next(state)
  end
end

def init_state(n, v)
  return {
    idx: 0,
    inst: [
      1,n,v,3,
      1,1,2,3,1,3,4,3,1,5,0,3,2,1,6,19,1,19,6,23,2,23,6,27,2,6,27,31,2,13,31,35,1,9,35,39,
      2,10,39,43,1,6,43,47,1,13,47,51,2,6,51,55,2,55,6,59,1,59,5,63,2,9,63,67,1,5,67,71,2,
      10,71,75,1,6,75,79,1,79,5,83,2,83,10,87,1,9,87,91,1,5,91,95,1,95,6,99,2,10,99,103,1,
      5,103,107,1,107,6,111,1,5,111,115,2,115,6,119,1,119,6,123,1,123,10,127,1,127,13,131,
      1,131,2,135,1,135,5,0,99,2,14,0,0
    ]
  }
end

(0..99).each do | n |
  (0..99).each do |v|
    state = init_state(n, v)
    run(state)
    if state[:inst][0] == 19690720
      puts "Found it"
      puts 100 * n + v
      return
    end
  end
end

