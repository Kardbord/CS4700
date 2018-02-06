;--------------------------- sort-list && helpers ------------------------------- ;

; sorts @_list
;
; param _list : a list to be sorted
; return     : sorted list
(define (sort-list _list) (begin
    (mergesort _list)
))

; sorts @_list using mergesort
;
; param _list : a list to be sorted
; return      : a sorted list
(define (mergesort _list , _sublist1 _sublist2) (begin
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
))

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

; ----------------------- sort-functions && helpers ----------------------------- ;


(define (sort-functions _list) true)


; ------------------------ compose-list && helpers ------------------------------ ;


(define (compose-list _list) true)


; --------------------------- squares && helpers -------------------------------- ;

(define (squares filename n) true)


; --------------------------- fractal && helpers -------------------------------- ;


(define (fractal filename dimension) true)

