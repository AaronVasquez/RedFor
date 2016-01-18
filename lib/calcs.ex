defmodule Calcs do
  
  def to_nearest_tenth(val) do
    val |> Float.ceil(1)
  end

  def to_km(velocity) do
    velocity / 1000
  end

  def to_m(km) do
    km * 1000
  end

  def square_root(val) do
    val |> :math.sqrt
  end

  def squared(val) do
    val * val
  end

  def cubed(val) do
    val * val * val
  end

  def seconds_to_hours(seconds) do
    seconds / 60 / 60 |> to_nearest_tenth
  end

end