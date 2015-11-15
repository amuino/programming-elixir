defmodule Perf do
  def measure(fun, times) do
    start = :os.timestamp
    Enum.each(1..times, fn(_)-> fun.() end)
    now = :os.timestamp
    timestamp_to_ns(now) - timestamp_to_ns(start)
  end

  def timestamp_to_ns({mega, sec, micro}) do
    (mega * 1_000_000 + sec) * 1_000_000 + micro
  end

end
