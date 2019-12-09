def valid?(num)
  prev = -1
  increased = false

  same_found_count = 1
  same_found = false

  num.to_s.split('').each do | i |
    # check increasing
    if i.to_i < prev
      increased = true
      break
    end

    if prev == i.to_i
      same_found_count += 1
    else
      if same_found_count == 2
        same_found = true
      end

      same_found_count = 1
    end

    prev = i.to_i
  end

  if same_found_count == 2
    same_found = true
  end

  !increased && same_found
end

start = 146810
_end = 612564

valid = []
(start.._end).each do | num |
  if valid? num
    valid << num
  end
end

puts valid.length

