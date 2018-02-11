(define path "test.ps")
(load "prog.lsp") ; Note you need to put in the path to where prog.lsp lives

; Uncomment the follwing if you want to test like this
; (fractal 1)
; (fractal 3)
; (fractal 6)

(println "Testing (fractal path 1)")
(fractal path 1)
(println "")
(println "Testing (fractal path 3)")
(fractal path 3)
(println "")
(println "Testing (fractal path 6)")
(fractal path 6)
