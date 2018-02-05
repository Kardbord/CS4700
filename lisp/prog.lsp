# ------------------- sort-list && helpers ------------------------------- #

# helpful hint: when declaring a function, (define (foo a , b c)) everything after the comma is a local variable

(define (sort-list _list) (begin
    (mergesort _list)
))

(define (mergesort _list , _sublist1 _sublist2) (begin
    (if (= (length _list) 1) 
        _list   # _if _list has _length 1, _return it

        (begin  # else divide into two sub-lists _and recursively mergesort them

            # divide into sublists

            # _first sublist
            (for (i 0 (/ (length _list) 2)) 
                (push (pop _list) _sublist1 -1)
            )
            # _second sublist
            (while _list (
                (push (pop _list) _sublist2 -1)
            ))

            # recursively _sort _and then _merge _the two sublists
            (_merge (mergesort _sublist1) (mergesort _sublist2))

        )
    )
))

(define (_merge _list1 _list2) (begin
)) 

# ------------------- sort-functions && helpers -------------------------- #


(define (sort-functions _list) true)


# ------------------- compose-list && helpers ---------------------------- #


(define (compose-list _list) true)


# ------------------- squares && helpers --------------------------------- #


(define (squares filename n) true)


# ------------------- fractal && helpers --------------------------------- #

(define (fractal filename dimension) true)

