defmodule PuzzleAb do
  @moduledoc """
  Documentation for PuzzleAb.
  """

  def get_string(n, k) do
    n
    |> generate_strings
    |> Enum.find(fn(s) ->
      is_match(s, k)
    end) || ""
  end

  def generate_strings(n) do
    max_val = (:math.pow(2, n) - 2) |> round
    max_binary_string = Integer.to_string(max_val, 2)
    string_length = String.length(max_binary_string)

    1..max_val
    |> Enum.map(fn(n) ->
      Integer.to_string(n, 2)
    end)
    |> Enum.map(fn(s) ->
      String.pad_leading(s, string_length, "0")
    end)
    |> Enum.map(fn(s) ->
      s
      |> String.replace("0", "A")
      |> String.replace("1", "B")
    end)
  end

  def is_match(s, k) do
    matches = 0..String.length(s) - 2
    |> Enum.reduce(0, fn(start_idx, outer_acc) ->
      1..String.length(s) - 1
      |> Enum.reduce(outer_acc, fn(end_idx, inner_acc) ->
        i = String.at(s, start_idx)
        j = String.at(s, end_idx)

        case i < j do
          true -> inner_acc + 1
          false -> inner_acc
        end
      end)
    end)

    matches == k
  end

end
