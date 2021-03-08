# ExConfusables

Compares two strings if they are visually confusable as described in [Unicode® Technical Standard #39](https://www.unicode.org/reports/tr39/#Confusable_Detection): Both strings get transformed into a skeleton format before comparing them. The skeleton is generated by normalizing the string ([NFD](http://unicode.org/reports/tr15/#Norm_Forms)), replacing [confusable characters](https://unicode.org/Public/security/latest/confusables.txt), and normalizing the string again.

## Usage

### ExConfusables.confusable?/2

Check if two strings are confusable for each other.

```elixir
iex> ExConfusables.confusable?("ℰlixir", "Elixir")
     true
```

### ExConfusables.skeleton/1

Transforms a unicode string by replacing unusual characters with similar-looking common characters,
  as specified by the [Unicode Standard Annex #39](http://www.unicode.org/reports/tr39/).

```elixir
iex> ExConfusables.skeleton("ℰlixir")
     "Elixir"
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_confusables` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_confusables, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ex_confusables](https://hexdocs.pm/ex_confusables).

## License

```
MIT License

Copyright (c) 2021 colacheng

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
