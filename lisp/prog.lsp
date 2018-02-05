# ------------------- sort-list && helpers ------------------------------- #


(define (sort-list _list) (begin
    (define _list2 '())
    (mergesort _list 0 (- (length _list) 1) _list2)
))

(define (mergesort _list i k _list2) (begin
    (if (!= i k) (begin
        (mergesort _list i (mid i k))
        (mergesort _list (+ (mid i k) 1) k)
        (_merge _list i (+ (mid i k) 1) (mid i k) k _list2)
    ))
))

# Since no assignment is allowed, _merge will be called recursively incrementing a && b
# param _list  : container to be sorted
# param a      : left index
# param b      : right index
# param mid    : upper bound for @a
# param end    : upper bound for @b
# param _list2 : _the sorted _list returned
(define (_merge _list a b mid end _list2) (begin
    (if (and (<= a mid) (<= b end)) (begin
        (if (<= (nth a _list) (nth b _list)) 
            (begin
                (push (nth a _list) _list2 -1) # _push _list[a] to _the back of _list2
                (_merge _list (+ 1 a) b mid end _list2))
            (begin
                (push (nth b _list) _list2 -1)
                (_merge _list a (+ 1 b) mid end _list2))
        )
    ))
    # TODO: copy remaining items from _list
))

# calculate midpoint between i && k
(define (mid i k) (begin
    (/ (+ i k) 2)
))


# ------------------- sort-functions && helpers -------------------------- #


(define (sort-functions _list) true)


# ------------------- compose-list && helpers ---------------------------- #


(define (compose-list _list) true)


# ------------------- squares && helpers --------------------------------- #


(define (squares filename n) true)


# ------------------- fractal && helpers --------------------------------- #

(define (fractal filename dimension) true)

