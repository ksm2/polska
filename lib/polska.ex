defmodule Polska do
  def main(args) do
    [number|_] = args
    IO.puts "The number " <> number <> " in Polish is “" <> print(number) <> ".”"
  end

  def print(number) do
    number |> String.codepoints |> polska
  end

  def polska(["-"|x]) do
    "minus " <> polska(x)
  end

  def polska(["0"]) do
    "zero"
  end

  def polska(["0"|x]) do
    polska(x)
  end

  def polska(["1"]) do
    "jeden"
  end

  def polska(["2"]) do
    "dwa"
  end

  def polska(["3"]) do
    "trzy"
  end

  def polska(["4"]) do
    "cztery"
  end

  def polska(["5"]) do
    "pięć"
  end

  def polska(["6"]) do
    "sześć"
  end

  def polska(["7"]) do
    "siedem"
  end

  def polska(["8"]) do
    "osiem"
  end

  def polska(["9"]) do
    "dziewięć"
  end

  def polska(["1", "0"]) do
    "dziesięć"
  end

  def polska(["1", x]) do
    nascie(polska([x])) <> "naście"
  end

  def polska([y, x]) do
    prefix = case y do
      "2" -> "dwadzieścia"
      "3" -> "trzydzieści"
      "4" -> "czterdzieści"
      y -> polska([y]) <> "dziesiąt"
    end

    prefix <> polska_concat([x])
  end

  def polska([z, y, x]) do
    {zn, _} = Integer.parse(z)
    prefix = case z do
      "1" -> "sto"
      "2" -> "dwieście"
      z when zn < 5 -> polska([z]) <> "sta"
      z -> polska([z]) <> "set"
    end
    prefix <> polska_concat([y, x])
  end

  def polska(a) when length(a) < 7 do
    {w, v} = Enum.split(a, -3)
    {num, _} = (w |> Enum.join |> Integer.parse)
    prefix = case w do
      ["1"] -> "tysiąc"
      _ when num < 5 -> polska(w) <> " tysiące"
      _ -> polska(w) <> " tysięcy"
    end
    prefix <> polska_concat(v)
  end

  def polska(a) do
    pot = div(length(a) - 1, 3)
    {w, v} = Enum.split(a, -3 * pot)
    prefix = case w do
      ["1"] -> pot |> pot_word
      _ -> pot |> pot_word |> pluralize(w)
    end
    prefix <> polska_concat(v)
  end

  def polska_concat(x) do
    p = polska(x)
    if (p == "zero") do
      ""
    else
      " " <> p
    end
  end

  def nascie(x) do
    case x do
      "jeden" -> "jede"
      "cztery" -> "czter"
      "pięć" -> "pięt"
      "sześć" -> "szes"
      "dziewięć" -> "dziewięt"
      _ -> x
    end
  end

  def pot_word(pot) do
    case pot do
       2 -> "milion"
       3 -> "miliard"
       4 -> "bilion"
       5 -> "biliard"
       6 -> "trylion"
       7 -> "tryliard"
       8 -> "kwadrylion"
       9 -> "kwadryliard"
      10 -> "kwintylion"
      11 -> "kwintyliard"
      12 -> "sekstylion"
      13 -> "sekstyliard"
      14 -> "septylion"
      15 -> "septyliard"
      16 -> "oktylion"
      17 -> "oktyliard"
    end
  end

  def pluralize(w, x) do
    polska(x) <> " " <> w <> "y"
  end
end
