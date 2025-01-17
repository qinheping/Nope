(set-logic LIA)

(synth-fun eq1 ( (x Int) (y Int) (z Int) ) Int
(
	(Start  Int (		x
		y
		0
		1
		(ite NT3 NT1 NT1)
		(+ NT1 NT1)
		(ite NT3 NT2 NT1)
		(ite NT3 NT1 NT2)
		(ite NT6 NT1 NT1)
		(+ NT2 NT1)
		(ite NT3 NT2 NT2)
		(ite NT3 NT4 NT1)
		(ite NT7 NT1 NT1)
		(+ NT2 NT2)
		(+ NT4 NT1)
		(ite NT3 NT5 NT1)
		(ite NT6 NT4 NT1)
		(ite NT6 NT1 NT4)
		(ite NT10 NT1 NT1)
		(+ NT5 NT1)
		(ite NT9 NT1 NT1)
		(ite NT3 NT8 NT1)
))
	(NT1  Int (		x
		y
		0
		1
		(ite NT3 NT1 NT1)
))
	(NT2  Int (		(+ NT1 NT1)
		(ite NT3 NT2 NT1)
		(ite NT3 NT1 NT2)
		(ite NT6 NT1 NT1)
))
	(NT3  Bool (		(= NT1 NT1)
		(>= NT1 NT1)
		(not NT3)
		(or NT3 NT3)
))
	(NT4  Int (		(+ NT2 NT1)
		(ite NT3 NT2 NT2)
		(ite NT3 NT4 NT1)
		(ite NT7 NT1 NT1)
))
	(NT5  Int (		(+ NT2 NT2)
		(+ NT4 NT1)
		(ite NT3 NT5 NT1)
		(ite NT6 NT4 NT1)
		(ite NT6 NT1 NT4)
		(ite NT10 NT1 NT1)
))
	(NT6  Bool (		(= NT2 NT1)
		(>= NT2 NT1)
		(not NT6)
		(or NT6 NT3)
))
	(NT7  Bool (		(= NT2 NT2)
		(>= NT2 NT2)
		(= NT4 NT1)
		(>= NT4 NT1)
		(not NT7)
		(or NT7 NT3)
		(or NT6 NT6)
))
	(NT8  Int (		(+ NT5 NT1)
		(ite NT9 NT1 NT1)
		(ite NT3 NT8 NT1)
))
	(NT9  Bool (		(= NT4 NT4)
		(>= NT4 NT4)
		(not NT9)
		(= NT8 NT1)
		(>= NT8 NT1)
		(or NT9 NT3)
		(or NT7 NT7)
))
	(NT10  Bool (		(= NT5 NT1)
		(>= NT5 NT1)
		(not NT10)
		(or NT10 NT3)
))
))

(define-fun iteB (( b1 Bool ) (b2 Bool ) (b3 Bool )) Bool ( or ( and b1 b2 ) ( and (not b1 ) b3 ) ) )
(define-fun plus2 ((b1 Int) (b2 Int)) Int ( + b1 b2))
(define-fun plus3 ((b1 Int) (b2 Int) (b3 Int)) Int ( +  ( + b1 b2) b3))
(define-fun plus4 ((b1 Int) (b2 Int) (b3 Int) (b4 Int)) Int ( +  ( plus3  b1 b2 b3) b4))
(define-fun plus5 ((b1 Int) (b2 Int) (b3 Int) (b4 Int) (b5 Int)) Int (+  ( plus4 b1 b2 b3 b4) b5))
(define-fun plus6 ((b1 Int) (b2 Int) (b3 Int) (b4 Int) (b5 Int) (b6 Int) ) Int (+  ( plus5 b1 b2 b3 b4  b5) b6  ))
(define-fun plus7 ((b1 Int) (b2 Int) (b3 Int) (b4 Int) (b5 Int) (b6 Int) (b7 Int)) Int (+  ( plus6 b1 b2 b3 b4  b5 b6 ) b7  ))
(define-fun plus8 ((b1 Int) (b2 Int) (b3 Int) (b4 Int) (b5 Int) (b6 Int) (b7 Int) (be Int)) Int (+  ( plus7 b1 b2 b3 b4  b5 b6 b7) be  ))
(define-fun plus9 ((b1 Int) (b2 Int) (b3 Int) (b4 Int) (b5 Int) (b6 Int) (b7 Int) (be Int) (bn Int)) Int (+  ( plus8 b1 b2 b3 b4  b5 b6 b7 be) bn  ))

(define-fun or3 ((b1 Bool) (b2 Bool) (b3 Bool)) Bool ( or ( or b1 b2) b3))
(define-fun one-times  ((b1 Int )) Int b1)
(define-fun two-times  ((b1 Int )) Int ( plus2 b1 b1))
(define-fun three-times  ((b1 Int )) Int ( plus3 b1 b1 b1))
(define-fun five-times  ((b1 Int )) Int ( plus5 b1 b1 b1 b1 b1 ))
(define-fun seven-times ((b1 Int )) Int ( plus7 b1 b1 b1 b1 b1 b1 b1 ))
(define-fun nine-times  ((b1 Int )) Int ( plus9 b1 b1 b1 b1 b1 b1 b1 b1 b1))
(define-fun ten-times  ((b1 Int )) Int ( plus9 b1 b1 b1 b1 b1 b1 b1 b1 ( plus2 b1 b1 )))
(define-fun minus ((b1 Int)) Int ( - 0  b1 ))

(declare-var x Int ) 
(declare-var y Int ) 
(declare-var z Int ) 


( constraint ( iteB ( >= (plus2 x y) 1 ) 
	            ( iteB ( >= (plus2 x z) 1 )
                         ( = (eq1 x y z)   ( + x 1 ) ) 
                         ( = (eq1 x y z )  ( + y 1 ) ) 
                     ) 
                     ( = (eq1 x y z)   ( + z 1 ) ) 
               
             )
)      





(check-synth)

