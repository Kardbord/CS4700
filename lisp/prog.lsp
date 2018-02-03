# ------------------- sort-list && helpers ------------------------------- #


(define (sort-list lst) (
    (mergesort lst)
))

(define (mergesort lst i k) (
    (if (!= i k) ((begin
        (mergesort lst i (mid i k))
        (mergesort lst (+ (mid i k) 1) k)
        (_merge lst i (mid i k) k)
    )))
))

(define (_merge lst i mid k) (
    
))

# calculate midpoint between i && k
(define (mid i k) (
    (/ (+ i k) 2)
))


# ------------------- sort-functions && helpers -------------------------- #


(define (sort-functions lst) true)


# ------------------- compose-list && helpers ---------------------------- #


(define (compose-list lst) true)


# ------------------- squares && helpers --------------------------------- #


(define (squares filename n) true)


# ------------------- fractal && helpers --------------------------------- #

(define (fractal filename dimension) true)

