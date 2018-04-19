defmodule PuzzleAbTest do
  use ExUnit.Case
  import PuzzleAb
  doctest PuzzleAb

  test "generate all possible strings of length N" do
    # For length 3: AAB, ABB, ABA, BAA, BBA, BAB
    # AAA and BBB are illegal.
    # Because A and B is a binary choice, this
    # makes calculating all combinations simpler.
    assert generate_strings(3) == ["AAB", "ABA", "ABB", "BAA", "BAB", "BBA"]
    assert generate_strings(4) |> Enum.count == 14
  end

  test "it determines if any string satisfies rules for k" do
    assert is_match("ABB", 2) == true
    assert is_match("AAB", 2) == true
    assert is_match("BAB", 2) == false
    assert is_match("BBA", 0) == true
    assert is_match("BAA", 0) == true
    assert is_match("ABA", 0) == false
    assert is_match("AABB", 4) == true
  end

  test "return first match for examples" do
    assert get_string(3, 2) == "AAB"
    assert get_string(3, 0) == "BAA"
    assert get_string(4, 4) == "AABB"
  end

  test "return empty string if no matches exist" do
    assert get_string(3, 3) == ""
  end
end
