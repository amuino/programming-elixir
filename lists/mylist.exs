defmodule MyList do
  def len([]), do: 0
  def len( [_head | tl] ), do: 1 + len(tl)

  def square([]), do: []
  def square([hd|tl]), do: [hd*hd | square(tl)]

  def add_1([]), do: []
  def add_1([hd|tl]), do: [hd + 1 | add_1(tl)]

  def map([], _), do: []
  def map([hd|tl], fun), do: [fun.(hd) | map(tl, fun)]

  def sum(list), do: _sum(list, 0)
  defp _sum([], total), do: total
  defp _sum([hd|tl], total), do: _sum(tl, total+hd)

  def sum2([]), do: 0
  def sum2([hd|tl]), do: hd + sum2(tl)

  def reduce([], value, _), do: value
  def reduce([head | tail], value, func), do: reduce(tail, func.(head, value), func)

  def mapsum(list, fun), do: sum(map(list, fun))
  def mapsum2([], _), do: 0
  def mapsum2([hd|tl], fun), do: fun.(hd) + mapsum2(tl, fun)

  def max([hd|tl]), do: _max(tl, hd)
  def _max([], current_max), do: current_max
  def _max([hd|tl], current_max) when current_max < hd, do: _max(tl, hd)
  def _max([_|tl], current_max), do: _max(tl, current_max)

  def max2([hd|tl]), do: reduce(tl, hd, &_max2/2)
  def _max2(a, b) when a < b, do: b
  def _max2(a, _), do: a

  @alpha_range ?z - ?a + 1
  def caesar(list, n), do: map(list, &(_cycle(&1, n)))
  def _cycle(char, n) when char + n <= ?z, do: char + n
  def _cycle(char, n), do: char + n - @alpha_range

  def span(from, to) when from > to, do: []
  def span(from, to), do: [from | span(from + 1, to)]

  def all?(list, fun \\ fn(x) -> x end)
  def all?([], _), do: true
  def all?([hd|tl], fun), do: !!fun.(hd) && all?(tl, fun)

  def each([], _), do: :ok
  def each([hd|tl], fun) do
    fun.(hd)
    each(tl, fun)
  end

  def filter([], _), do: []
  def filter([hd|tl], fun) do
    if fun.(hd) do
      [hd | filter(tl, fun)]
    else
      filter(tl, fun)
    end
  end

  def split(list, count), do: _split(list, count, {[], []})
  def _split([], _, result), do: result
  def _split(list, 0, {first, second}), do: {first, second ++ list }
  def _split([hd|tl], count, {first, second}) do
    _split tl, count - 1, { first ++ [hd], second }
  end

  def take(collection, count)
  def take([], _), do: []
  def take(_, 0), do: []
  def take([hd|tl], count), do: [hd|take(tl, count - 1)]

  def flatten(list)
  def flatten([]), do: []
  def flatten([[]|_]), do: []
  def flatten([ hd = [_|_] | tl ]), do: flatten(hd) ++ flatten(tl)
  def flatten([hd|tl]), do: [ hd | flatten(tl) ]




end
