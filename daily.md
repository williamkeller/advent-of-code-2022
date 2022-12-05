## Day 06

Pretty easy. My best showing so far on the global leaderboard: 4396th place!

## Day 05

Wasted a lot of time parsing the initial stack diagram. It seems like most
people crunched that by hand, and then did parsing for the rest of the input. On
the plus side, my solution will work with anyone's input, no ahnd-crunching
required. Also had a problem where the runner was stripping off whitespace in
the stack diagram, which was causing failures. Need to keep an eye on if
changing the runner breaks anything else.

## Day 04

Got a late start. Which is too bad, because the puzzle was pretty easy, and I
got it done pretty quick. Not competitively quick, of course, but still fast by
our local group's standards.

## Day 03

Took too long looking up how to do dumb things like turn a string into an array,
a letter into its ascii value, and intersections of arrays. (I originally had a
brute force looping construct for part one, when Array#intersection does the
job.

## Day 02

Using lookup tables feels a little like cheating, and would not be sustainable
with a larger data set. But for this, it works. With tables, there is no real
logic, just loop through the input and lookup on the tables.

## Day 01

Wasn't feeling well, so missed the start. Puzzle was straightforward, although I
bobbled a little on the project setup from last year. Going to try and document
a little better, so maybe next year it's not a big surprise. Rails has a nice
Array#split method that would have been great here, but it's not part of stock
Ruby. Perhaps I should start building my own library of this kind of thing.
