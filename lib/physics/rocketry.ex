defmodule Physics.Rocketry do
  import Calcs
  import Physics.Laws

  def escape_velocity(),       do: :earth |> escape_velocity
  def escape_velocity(:earth), do: Planets.earth |> escape_velocity
  def escape_velocity(:mars),  do: Planets.mars |> escape_velocity
  def escape_velocity(:moon),  do: Planets.moon |> escape_velocity
  def escape_velocity(planet) when is_map(planet) do
    planet
      |> calculate_escape
      |> to_km
      |> to_nearest_tenth
  end


  def orbital_speed(height) do
    newtons_gravitational_constant * Planets.earth.mass / orbital_radius(height)
      |> square_root
  end

  def orbital_acceleration(height) do
    (orbital_speed(height) |> squared) / orbital_radius(height)
  end

  def orbital_term(height) do
    4 * (:math.pi |> squared) * (orbital_radius(height) |> cubed) /
        newtons_gravitational_constant * Planets.earth.mass
      |> square_root
      |> seconds_to_hours
  end

  # Private

  defp calculate_escape(%{mass: mass, radius: radius}) do
    2 * newtons_gravitational_constant * mass / radius
      |> square_root
  end

  defp orbital_radius(height),         do: :earth |> orbital_radius(height)
  defp orbital_radius(:earth, height), do: Planets.earth |> orbital_radius(height)
  defp orbital_radius(:mars, height),  do: Planets.mars |> orbital_radius(height)
  defp orbital_radius(:moon, height),  do: Planets.moon |> orbital_radius(height)
  defp orbital_radius(planet, height), do: planet.radius + (height |> to_m)

end