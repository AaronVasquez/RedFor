defmodule SolarTest do
  use ExUnit.Case, async: true
  use Timex

  setup_all do
    flares = [
      %{classification: :X, scale: 99, date: Date.from({1859, 8, 29})},
      %{classification: :M, scale: 5.8, date: Date.from({2015, 1, 12})},
      %{classification: :M, scale: 1.2, date: Date.from({2015, 2, 9})},
      %{classification: :C, scale: 3.2, date: Date.from({2015, 4, 18})},
      %{classification: :M, scale: 83.6, date: Date.from({2015, 6, 23})},
      %{classification: :C, scale: 2.5, date: Date.from({2015, 7, 4})},
      %{classification: :X, scale: 72, date: Date.from({2012, 7, 23})},
      %{classification: :X, scale: 45, date: Date.from({2003, 11, 4})},
    ]
    {:ok, data: flares}
  end

  test "There are 8 solar flares", %{ data: flares } do
    assert flares |> length == 8
  end

  test "Classification X" do
    assert %{classification: :X, scale: 1} |> Solar.power == 1000
  end

  test "Classification M" do
    assert %{classification: :M, scale: 1} |> Solar.power == 10
  end

  test "Classification C" do
    assert %{classification: :C, scale: 1} |> Solar.power == 1
  end

end
