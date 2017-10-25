defmodule SecretHandshake do
  use Bitwise

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    %{0b00001 => "wink", 0b00010 => "double blink", 0b00100 => "close your eyes", 0b01000 => "jump"}
    |> Enum.filter_map(fn {b,_} -> code <~> b end, fn {_,v} -> v end)
    |> doif(code <~> 0b10000, &Enum.reverse/1)
  end

  def left <~> right do
    (left &&& right) > 0
  end

  def doif(x, test, f) do
    if test, do: f.(x), else: x
  end
end

