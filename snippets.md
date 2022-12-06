# Ruby snippets

Things that I should remember from year to year, but don't, because I only end
up using them during Advent of Code.

```
# Convert a string into an array
String#chars
```

```
# Find the common elements in two arrays
Array#intersection(Array)
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

```
# Regular expression global variables
$~ is Regexp.last_match;
$& is Regexp.last_match[ 0 ];
$1, $2, and so on are Regexp.last_match[ i ] (captures by number);
$` is Regexp.last_match.pre_match;
$' is Regexp.last_match.post_match;
$+ is Regexp.last_match[ -1 ] (the last capture).
