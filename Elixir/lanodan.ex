#!/usr/bin/env elixir
z = [0x7a, 0x7A]
f = [0x46,0x69] ++ z
b = [0x42, 0x75] ++ z

bu = Enum.reduce(3..100//3, %{}, fn x, acc -> Map.put(acc, x, b) end)
fi = Enum.reduce(5..100//5, %{}, fn x, acc -> Map.put(acc, x, f) end)
fb = Enum.reduce(15..100//15, %{}, fn x, acc -> Map.put(acc, x, f++b) end)

for x <- 1..100 do
	r = cond do
	  Map.has_key?(fb, x) -> fb[x]
	  Map.has_key?(bu, x) -> bu[x]
	  Map.has_key?(fi, x) -> fi[x]
	  true -> nil
	end
	
	IO.puts("#{x} => #{r}")
end
