# Description
greed is a collection of Scheme utilities split to three parts:
- list-utils - a collection of utilities to manipulate Scheme list.
- resistors - a collection of utilities that extracts information form the resistor color code.
- misc - everything else that doesn't fit elsewhere.

greed is written with [chicken](http://call-cc.org) Scheme implementation in mind. Current version of greed is v0.1.

### Loading greed
  Loading greed to your Scheme interpreter is as simple as:

  ``` scheme
  (load "/path/to/greed.scm")
  ```

  If loading was succesfull, you should see something like this:
  ```
  ; loading greed.scm ...
  ; loading misc.scm ...
  ; misc loaded successfully.
  ;; loading list-utils.scm ...
  ; list-utils loaded successfully.
  ; loading resistors.scm ...
  ; resistors loaded successfully.
  ; greed-v0.1 loaded successfully.
  ; See LICENSE file for details
  ```

#### What's in list-utils.scm

  Here's the list with all the utilities:

  - append-element
  - exists-in?
  - insert
  - last
  - list-sublists
  - negative-car?
  - neg-in-list?
  - not-atom?
  - nth
  - positive-car?
  - prepend-element
  - random-element
  - sublist?
  - swap-pair

#### Usage examples for list-utils

  - append-element: accepts as input an element and a list and adds that element
  to the end of the list. Usage example:
    ``` scheme
    (append-element 3 (list 0 1 2))
    (0 1 2 3) ; output
    ```

  - exists-in?: takes as input an element and a list. Checks if element exists
  in list. Usage examples:
    ``` scheme
    (exists-in? 3 (list 12 3 4))
    #t ; output
    ```
    
    ``` scheme
    (exists-in? 'a (list 12 3 4))
    #f ; output
    ```

  - insert: inserts an element to a list to the given position. Usage example:

  ``` scheme
  ; This adds number 4 as the third element of the list indexing starts from 1.
  (insert (list 1 2 7 8 0 9) 3 4)
  (1 2 7 4 8 0 9) ; output.
  ```

- last: return the last element of a list. Usage examples:

  ``` scheme
  (last (list 1 2 23 7 'a 'b 'c))
  c ; output
  ```

- list-sublists: if the given list is a list of lists, print the sublists. Usage examples:

  ``` scheme
  (list-sublists (list 2 3 (list 2 4)))
  ((2 4)) ; output
  ```

  ``` scheme
  (list-sublists (list 2 3 (list 2 4) (list '1 'a 'c)))
  (2 4) ; output
  (1 a c) ; output
  ```

- negative-car?: check if the car of a list is negative. Usage example:

  ``` scheme
  (negative-car? (list 1 2))
  #f ; output
  ```

  ``` scheme
  (negative-car? (list -1 2))
  #t ; output
  ```

- not-atom?: returns true if item passed to not-atom? isn't an atom. Usage examples:

  ``` scheme
  (not-atom? (list 1 2 3))
  #t ; output
  ```

  ``` scheme
  (not-atom? '())
  #f ; output
  ```

- nth: returns the nth item of a list. Indexing from 1. If nth element doesn't
exist, returns nil. Usage examples:

  ``` scheme
  (nth 3 (list 1 2 2389))
  2389 ; output
  ```

  ``` scheme
  (nth 3 (list 1 2))
  nil ; output
  ```

- positive-car?: works the same way negative-car? does. It just returns true if
car of given list is positive, false otherwise. Usage examples:

  ``` scheme
  (positive-car? (list -1 2 3))
  #f ; output
  ```

  ``` scheme
  (positive-car? (list 1 2 3))
  #t ; output
  ```

- prepend-element: adds element to the beginning of a list. Usage examples:

  ``` scheme
  (prepend-element (list -2 -3 0) -1)
  (-1 -2 -3 0) ; output
  ```

- random-element: get a random element from a list. It uses chicken's random.
Usage examples:

  ``` scheme
  (random-element (list 1 2 23 3))
  3 ; output
  ```

  ``` scheme
  (random-element (list 1 2 23 3))
  1 ; output
  ```
    
- sublist?: checks if there's a sublist in the given list. Usage examples:

  ``` scheme
  (sublist? (list (list 1 3 4 5) 34 3241 -1 34))
  #t ; output
  ```

  ``` scheme
  (sublist? (list 1 2 3))
  #f ; output
  ```

  ``` scheme
  (sublist? (cons 1 2))
  please enter a list ; output
  ```

- swap-pair: takes as input a pair, returns the pair with items swaped.
Usage examples:

  ``` scheme
  (swap-pair (cons '1 'a))
  (a . 1) ; output
  ```

#### What's in misc.
  misc currently has available only one procedure (the helping procedure is not
  counted) that computes the sum of the elements of the geometric progression
  1, 2, 4, 8, ...

#### Usage example for geometric-series:

  ``` scheme
  ; adds the first five elements of the progression starting from 1.
  (geometric-series 5 1)
  31 ; output
  ```

#### What's in resistors.scm

  - colors-to-resistance: takes as input a list of colors, and returns
  resistance information.

#### How to use resistors.scm

  Converting resistor color code to information that humans can understand, all
  the user has to do is something like:

  ``` scheme
    (colors-to-resistance (list "red" "blk" "red" "red"))
    2000 Ohm, tolerance: 2% ; output
  ```

  ```
  (colors-to-resistance (list "red" "blk" "red"))
  2000 Ohm, tolerance: 20% ; output
  ```

#### Known bugs

- list-utils: list-sublist has a different output if there's only one sublist.

- colors-to-resistance: Doesn't make sure that all colors are acceptable.

Please report any bug at mr.dwts <AT> gmail <DOT> com
