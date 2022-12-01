# 2022 Advent of Code

To run a particular puzzle, use the runner tool.

`ruby runner.rb` will run puzzles, based on the arguments below.

Arguments are:
  `-d n` where n is 1 to 25, defaults to today (only correct in central time)
  `-p n` where p is 1 or 2, for the puzzle of the day, defaults to 1
  `-t` if set, use the test data instead of real data, no default

This is (usually) called from vim bindings, rather than the command line.

For this to work, it requires some convention-over-configuration.

Puzzles are grouped in one day per file, named "dayNN.rb", where NN is the day
of the calendar (prepended with 0 if necessary).

Puzzle data goes in the `data` folder, and is named "dayNN.txt" or
dayNN_test.txt", depending on whether the data is real data or test data.

Puzzles are each contained in their own methods, called `part_one` and
`part_two`.

Data is normally read by the test runner and passed to `part_one` and `part_two`
as parameters. Data is usually represented as an array of strings, each string
corresponding to a line of text from the data file.

If there is a `transform_data` method in the source file, it is called first. It takes
the normal lines of data, and emits the data in whatever format makes sense for
the puzzle. There is no need to call `transform_data` directly; the runner will
do that before invoking the puzzle methods.


## Vim notes

To use the runner from vim, make the following available somewhere in your
configuration. I use a project local .vimrc file, since this config is only
meaningful with Advent of Code.

```
nnoremap <leader>1 :! ruby runner.rb -p 1<CR>
nnoremap <leader>2 :! ruby runner.rb -p 2<CR>
nnoremap <leader>t1 :! ruby runner.rb -p 1 -t<CR>
nnoremap <leader>t2 :! ruby runner.rb -p 2 -t<CR>
```
