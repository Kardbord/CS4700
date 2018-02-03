(define path "path to your .ps or .htm")
(load "prog.lsp") ; Note you need to put in the path to where prog.lsp lives

; Uncomment the follwing if you want to test like this
; (squares 1)
; (squares 5)
; (squares 8)

(println "Testing (squares path 1)")
(squares path 1)
(println "")
(println "Testing (squares path 5)")
(squares path 5)
(println "")
(println "Testing (squares path 8)")
(squares path 8)
