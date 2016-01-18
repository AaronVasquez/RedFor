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

defmodule Physics.Rocketry do
  import Calcs

  @earth %{ mass: 5.972e24, radius: 6.371e6 }
  @mars %{ mass: 6.39e23, radius: 3.4e6 }
  @moon %{ mass: 7.35e22, radius: 1.738e6 }

  def escape_velocity(:earth) do
    @earth |> escape_velocity
  end

  def escape_velocity(:mars) do
    @mars |> escape_velocity
  end

  def escape_velocity(:moon) do
    @moon |> escape_velocity
  end

  def escape_velocity(planet) when is_map(planet) do
    planet
      |> calculate_escape
      |> to_km
      |> to_nearest_tenth
  end

  
  defp calculate_escape(%{mass: mass, radius: radius}) do
    newtons_constant = 6.67e-11
    2 * newtons_constant * mass / radius
      |> square_root
  end

end