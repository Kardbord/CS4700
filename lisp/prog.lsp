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

; writes PostScript code to draw @n alternating black and grey squares in a line 
; renders that PostScript code to @filename
; 
; param filename : the file to which the PostScript code will be saved and rendered
; param n        : the number of squares to draw
; return         : the ending position of the turtle
(define (squares filename n) (begin
    (module "postscript.lsp") ; load postscript module
    (ps:translate 100 100)    ; translate turtle so as to not draw at the bottom of the page

    (for (x 1 n)              ; draw n squares
        (if (= (mod x 2) 0)
            (begin ; draw a grey square
              (ps:fill-color 0.5 0.5 0.5)
              (ps:line-color 0.5 0.5 0.5)
              (ps:rectangle 30 30 true)
            )
            (begin ; else draw a black square
              (ps:fill-color 0 0 0)
              (ps:line-color 0 0 0)
              (ps:rectangle 30 30 true)
            )
        )
        (ps:translate 30 0) ; position the turtle to draw the next square
    )
    (ps:render filename)    ; render the PostScript to @filename
))


; --------------------------- fractal and helpers -------------------------------- ;

; writes PostScript to draw a tree-like fractal of @dimension and renders that PostScript to @filename
;
; param filename  : the file to which the PostScript code will be saved and rendered
; param dimension : the dimension of the fractal; i.e. how many times to recurse
; return          : the position of the turtle
(define (fractal filename dimension) (begin
    (module "postscript.lsp") ; load PostScript module
    (ps:translate 300 100)    ; translate origin and move turtle to roughly bottom center of page
    (ps:line-width 8)         ; set line-width to 8 pts
    (draw-fractal dimension)  ; begin fractal recursion
    (ps:render filename)      ; render PostScript code to @filename
))

; helper function to (fractal) function
; draws a tree-like fractal by drawing a line and recursing @dimension times
;
; param dimension : the number of times to recurse and draw the fractal
(define (draw-fractal dimension) 
    (if 
        (= dimension 1) (ps:draw 200) ; base case

        (> dimension 1) (begin
            ; draw base of tree
            (ps:draw 200)
            (ps:translate)
            (ps:goto 0 0) ; not sure why this is necessary, but it is
            (ps:scale 0.5 0.5)

            ; recursively draw top branch of tree
            (ps:gsave)
            (draw-fractal (- dimension 1)) ;
            (ps:grestore)

            ; recursively draw left branch of tree
            (ps:gsave)
            (ps:turn -45)
            (draw-fractal (- dimension 1))
            (ps:grestore)

            ; recursively draw right branch of tree
            (ps:gsave)
            (ps:turn 45)
            (draw-fractal (- dimension 1))
            (ps:grestore)
        )
    )
)

