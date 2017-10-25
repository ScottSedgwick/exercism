defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> String.replace(~r/[\!\&\@\$\%\^\&\:]/, "")
    |> String.downcase
    |> String.split([" ", ",", "_"])
    |> count_words
  end

  def count_words(words) do
    Enum.reduce(words, %{}, &Words.incmap/2)
  end

  def incmap(word, map) do
    if ((word == nil) || (word == "")) do
      map
    else
      if Map.has_key?(map, word) do
        Map.put(map, word, Map.get(map, word) + 1)
      else
        Map.put_new(map, word, 1)
      end
    end
  end
end
