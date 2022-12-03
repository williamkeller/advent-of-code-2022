# Ruby snippets

Things that I should remember from year to year, but don't, because I only end
up using them during Advent of Code.

```
# Convert a string into an array
String#chars
```

```
# Find the common elements in two arrays
Array#interaction(Array)
```

```
# Find the ascii (or utf8) value of a character
# Operates on the first character in the string, if it's longer than one char
String#ord
```

```
# Iterating over ranges within an array
Array.each_slice(stepn) do |var1, var2, varn|
```
