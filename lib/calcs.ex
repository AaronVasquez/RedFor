defmodule Calcs do
  
  def to_nearest_tenth(val) do
    val |> Float.ceil(1)
  end

  def to_km(velocity) do
    velocity / 1000
  end

  def square_root(val) do
    val |> :math.sqrt
  end

end