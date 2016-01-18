defmodule PhysicsTest do
  use ExUnit.Case
  doctest Physics

  test "calculates earth's escape velocity" do
    assert Physics.Rocketry.escape_velocity(:earth) == 11.2
  end
end
