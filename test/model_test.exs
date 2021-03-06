defmodule ModelTest do
  use ExUnit.Case

  alias Settings.Model

  test "should create settings item" do
    rv = Model.create([MySettings])

    assert rv[MySettings.key()] == MySettings.init()
  end

  test "should decode map to model" do
    json = %{
      MySettings.key() => MySettings.init() |> to_string(),
    }

    rv = Model.decode(json, [MySettings])

    assert rv[MySettings.key()] == MySettings.init()
  end

  test "should add new setting to existent settings" do
    rv = Model.add(%{}, MySettings)

    assert rv[MySettings.key()] == MySettings.init()
  end
end

