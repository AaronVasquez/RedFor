defmodule PhysicsTest do
  use ExUnit.Case
  doctest Physics

  test "calculates Earth's escape velocity" do
    assert Physics.Rocketry.escape_velocity(:earth) == 11.2
  end

  test "calculates Mars's escape velocity" do
    assert Physics.Rocketry.escape_velocity(:mars) == 5.1
  end

  test "calculates Moon's escape velocity" do
    assert Physics.Rocketry.escape_velocity(:moon) == 2.4
  end
end
