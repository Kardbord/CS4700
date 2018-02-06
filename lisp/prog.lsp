# ------------------- sort-list && helpers ------------------------------- #

# sorts @_list
#
# param _list : a list to be sorted
# _return     : sorted list
(define (sort-list _list) (begin
    (mergesort _list)
))

# sorts @_list using mergesort
#
# param _list : a list to be sorted
# _return     : a sorted list
(define (mergesort _list , _sublist1 _sublist2) (begin
    (if (= (length _list) 1) 
        _list   # _if _list has _length 1, _return it

        (begin  # else divide into two sub-lists _and recursively mergesort them

            # divide into sublists

            # _first sublist
            (for (i 1 (/ (length _list) 2)) 
                (push (pop _list) _sublist1 -1)
            )
            # _second sublist
            (while _list 
                (push (pop _list) _sublist2 -1)
            )

            # recursively _sort _and then _merge _the two sublists
            (_merge (mergesort _sublist1) (mergesort _sublist2))

        )
    )
))

# merges _the two sorted lists @_list1 _and @_list2
#
# param _list1 : _first sorted list
# param _list2 : _second sorted list
# _return      : a merged sorted list from @_list1 _and @_list2
(define (_merge _list1 _list2 , _sortedList) (begin

    # make sure interpreter knows _sortedList is a list
    (push 1 _sortedList) (pop _sortedList)

    # iterate through each list _and _merge elements appropriately
    (while (and _list1 _list2) 
        (if (<= (nth 0 _list1) (nth 0 _list2))
            (push (pop _list1) _sortedList -1) # _if _list1[0] _<_ _list2[0] place _list1[0] into _sortedList.back
            (push (pop _list2) _sortedList -1) # else place _list2[0] into _sortedList.back
        )
    )

    # one of _the lists (but _not both) may still contain elements
    # place any remaining items into _sorted lists
    # note that this works since @_list1 _and @_list2 are already sorted

    (if (empty? _list1)
        (append _sortedList _list2)
        (append _sortedList _list1)
    )
)) 

# ------------------- sort-functions && helpers -------------------------- #


(define (sort-functions _list) true)


# ------------------- compose-list && helpers ---------------------------- #


(define (compose-list _list) true)


# ------------------- squares && helpers --------------------------------- #


(define (squares filename n) true)


# ------------------- fractal && helpers --------------------------------- #

(define (fractal filename dimension) true)

