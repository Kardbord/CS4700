;--------------------------- sort-list and helpers ------------------------------- ;

; sorts @_list
;
; param _list : a list to be sorted
; return      : sorted list
(define (sort-list _list)
    (mergesort _list)
)

; sorts @_list using mergesort
;
; param _list : a list to be sorted
; return      : a sorted list
(define (mergesort _list , _sublist1 _sublist2)
    (if (<= (length _list) 1) 
        _list   ; if @_list has length 1 or 0, return it

        (begin  ; else divide into two sub-lists and recursively mergesort them

            ; divide into sublists

            ; first sublist
            (for (i 1 (/ (length _list) 2)) 
                (push (pop _list) _sublist1 -1)
            )
            ; second sublist
            (while _list 
                (push (pop _list) _sublist2 -1)
            )

            ; recursively sort and then _merge the two sublists
            (_merge (mergesort _sublist1) (mergesort _sublist2))

        )
    )
)

; merges the two sorted lists @_list1 and @_list2
;
; param _list1 : first sorted list
; param _list2 : second sorted list
; return       : a merged sorted list from @_list1 _and @_list2
(define (_merge _list1 _list2 , _sortedList) (begin

    ; make sure interpreter knows _sortedList is a list
    (push 1 _sortedList) (pop _sortedList)

    ; iterate through each list and merge elements appropriately
    (while (and _list1 _list2) 
        (if (<= (nth 0 _list1) (nth 0 _list2))
            (push (pop _list1) _sortedList -1) ; if @_list1[0] < @_list2[0] place @_list1[0] into _sortedList.back
            (push (pop _list2) _sortedList -1) ; else place @_list2[0] into _sortedList.back
        )
    )

    ; one of the lists (but not both) may still contain elements
    ; place any remaining items into _sortedList
    ; note that this works since @_list1 _and @_list2 are already sorted

    (if (empty? _list1)
        (append _sortedList _list2)
        (append _sortedList _list1)
    )
)) 

; ----------------------- sort-functions and helpers ----------------------------- ;

; sorts @_list
;
; param _list : a list of single parameter functions to be sorted
; return      : sorted list
(define (sort-functions _list , _sublist1 _sublist2) 
    (if (<= (length _list) 1) 
        _list   ; if @_list has length 1 or 0, return it

        (begin  ; else divide into two sub-lists and recursively mergesort them

            ; divide into sublists

            ; first sublist
            (for (i 1 (/ (length _list) 2)) 
                (push (pop _list) _sublist1 -1)
            )
            ; second sublist
            (while _list 
                (push (pop _list) _sublist2 -1)
            )

            ; recursively sort and then _merge the two sublists
            (merge-functions (sort-functions _sublist1) (sort-functions _sublist2))

        )
    )
)

; merges the two sorted lists @_list1 and @_list2
;
; param _list1 : first sorted list
; param _list2 : second sorted list
; return       : a merged sorted list from @_list1 _and @_list2
(define (merge-functions _list1 _list2 , _sortedList) (begin

    ; make sure interpreter knows _sortedList is a list
    (push 1 _sortedList) (pop _sortedList)

    ; iterate through each list and merge elements appropriately
    (while (and _list1 _list2) 
        (if (compare-functions-lt (nth 0 _list1) (nth 0 _list2) 0)
            (push (pop _list1) _sortedList -1) ; if @_list1[0] < @_list2[0] place @_list1[0] into _sortedList.back
            (push (pop _list2) _sortedList -1) ; else place @_list2[0] into _sortedList.back
        )
    )

    ; one of the lists (but not both) may still contain elements
    ; place any remaining items into _sortedList
    ; note that this works since @_list1 _and @_list2 are already sorted

    (if (empty? _list1)
        (append _sortedList _list2)
        (append _sortedList _list1)
    )
))

; compares two single parameter functions @f and @g using @n
; @n should always be 0 in the initial call
;
; a function @f is 'less than' a function @g if and only if there exists some non-negative value n such that:
; (f n) < (g n) and for all 0 <= i <= (n - 1) (f i) == (g i)
;
; param f : the first single parameter function to be compared
; param g : the second single parameter function to be compared
; param n : the initial 'i' to begin comparing the two functions with
; return  : true if @f is less than @g
(define (compare-functions-lt f g n)
    (if 
       (> (f n) (g n)) nil
       (< (f n) (g n)) true 
       (= (f n) (g n)) (compare-functions-lt f g (+ n 1))
    )
)


; ------------------------ compose-list and helpers ------------------------------ ;

; composes a list of 1-parameter functions into a single function
;
; param _list : a list of single-parameter functions to be composed into one function
; return      : a function composed of the functions in @_list
(define (compose-list _list)
    (if 
        (= (length _list) 2) (compose (pop _list) (pop _list))          ; compose the last two functions
        (> (length _list) 2) (compose (pop _list) (compose-list _list)) ; recursively compose remaining functions 
        (= (length _list) 1) (pop _list)                                ; if _list only ever had one function f, return f
        (empty? _list)       nil                                        ; if _list is empty, return nil
    )
)

; composes two single-parameter functions together
; this function is courtesy of Dr. Dyreson
;
; param f : a single-parameter function
; param g : a single-parameter function
; return  : a function composed of @f and @g
(define (compose f g)
    (expand (lambda (x) (f (g x))) 'f 'g)
)


; --------------------------- squares and helpers -------------------------------- ;

(define (squares filename n) true)


; --------------------------- fractal and helpers -------------------------------- ;


(define (fractal filename dimension) true)

