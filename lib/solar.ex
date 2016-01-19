defmodule Solar do

  def power(%{classification: :X, scale: s}), do: s * 1000  
  def power(%{classification: :M, scale: s}), do: s * 10
  def power(%{classification: :C, scale: s}), do: s

  def no_eva(flares) do
    flares |> Enum.filter(&( &1 |> power > 1000))
  end

  def deadliest(flares) do
    flares
    |> Enum.map(&(&1 |> power))
    |> Enum.max
  end

end