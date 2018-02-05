# ------------------- sort-list && helpers ------------------------------- #


(define (sort-list _list) (begin
    (mergesort _list)
))

(define (mergesort _list i k) (begin
    (if (!= i k) ((begin
        (mergesort _list i (mid i k))
        (mergesort _list (+ (mid i k) 1) k)
        (_merge _list i (mid i k) k)
    )))
))

(define (_merge _list i mid k) (begin
    (define _list2 '())
    (for (a i mid) (begin
                     
    ))
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

