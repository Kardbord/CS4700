# ------------------- sort-list && helpers ------------------------------- #

# helpful hint: when declaring a function, (define (foo a , b c)) everything after the comma is a local variable

(define (sort-list _list) (begin
    (mergesort _list)
))

(define (mergesort _list) (begin
    # mergesort should always return a list
    # first order of business is to check base case. If _list has a length of 1, return it
        # this is done simply by saying _list
    # the next order of business is to divide the list in half.
        # hint: create two sublists right off the bat. There is an easy way to do this.
        # hint: there is no need to keep _list intact
            # for one, since it is passed by value, and for two, we are going to sort it anyways
    # next we need to sort those two sublists. Probably a good time to recurse
    # finally, we need to _merge those two sublists together
))

(define (_merge _list1 _list2) (begin
    # helpful hint: (while (and a b)) will keep looping until one of the lists is empty
    # helpful hint: use push and pop commands
    # onto the merging algorithm:
    # we will need a third list to put stuff into. we will return this list when we are finished merging
    # while _list1 and _list2 are not empty, compare their 0th elements to each other
    # whichever is smallest should be pushed onto _list3 and popped from its list of origin
    # once one of the lists is empty, we will break from the loop
    # we still need to check that there are no leftovers on either of the lists (though we know at least one is empty)
    # so while the first list is not empty, pop its elements off one by one and push them onto the back of _list3
    # and while the second list is not empty, pop its elements off one by one and push them onto _list3
    # once the lists are merged, dont forget to return _list3
)) 

# ------------------- sort-functions && helpers -------------------------- #


(define (sort-functions _list) true)


# ------------------- compose-list && helpers ---------------------------- #


(define (compose-list _list) true)


# ------------------- squares && helpers --------------------------------- #


(define (squares filename n) true)


# ------------------- fractal && helpers --------------------------------- #

(define (fractal filename dimension) true)

