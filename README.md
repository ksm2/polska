# 🇵🇱 Liczby w języku polskim 🇵🇱

(The Numbers in Polish)

**This Elixir program is able to speak out all numbers from -999999999999999999999999999999999999999999999999999999 to +999999999999999999999999999999999999999999999999999999 in Polish.**

## Getting Started

After checking out, run `mix escript.build`, which will create a binary `polska`. Just call it with a number of oyur choice, e.g. `./polska 42`, which will print out

```
The number 42 in Polish is “czterdzieści dwa.”
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `polska` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:polska, "~> 0.1.0"}]
    end
    ```

  2. Ensure `polska` is started before your application:

    ```elixir
    def application do
      [applications: [:polska]]
    end
    ```

