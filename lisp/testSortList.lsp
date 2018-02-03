(load "prog.lsp") ; Note you need to put in the path to where prog.lsp lives

; Uncomment the follwing if you want to test like this
; (sortList '(2 1 1 2))
; (sortList '(2 1 3))
; (sortList '())

(println "Testing (sort-list '(2 1 1 2))")
(println (sort-list '(2 1 1 2)))
(println "")
(println "Testing (sort-list '(2 1 3))")
(println (sort-list '(2 1 3)))
(println "")
(println "Testing (sort-list '(2))")
(println (sort-list '(2)))
(println "")
(println "Testing (sort-list '())")
(println (sort-list '()))
