(set-logic LIA)

(synth-fun ex ((x Int) (y Int)) Int
	((Start Int (x y  0 1 (+ Start Start))))
)

(define-fun iteB (( b1 Bool ) (b2 Bool ) (b3 Bool )) Bool ( or ( and b1 b2 ) ( and (not b1 ) b3 ) ) )
(define-fun plus2 ((b1 Int) (b2 Int)) Int ( + b1 b2))
(define-fun plus3 ((b1 Int) (b2 Int) (b3 Int)) Int ( +  ( + b1 b2) b3))
(define-fun plus4 ((b1 Int) (b2 Int) (b3 Int) (b4 Int)) Int ( +  ( plus3  b1 b2 b3) b4))
(define-fun plus5 ((b1 Int) (b2 Int) (b3 Int) (b4 Int) (b5 Int)) Int (+  ( plus4 b1 b2 b3 b4) b5))
(define-fun plus6 ((b1 Int) (b2 Int) (b3 Int) (b4 Int) (b5 Int) (b6 Int) ) Int (+  ( plus5 b1 b2 b3 b4  b5) b6  ))
(define-fun plus7 ((b1 Int) (b2 Int) (b3 Int) (b4 Int) (b5 Int) (b6 Int) (b7 Int )) Int (+  ( plus6 b1 b2 b3 b4  b5 b6 ) b7  ))
(define-fun plus8 ((b1 Int) (b2 Int) (b3 Int) (b4 Int) (b5 Int) (b6 Int) (b7 Int) (b8 Int )) Int (+  ( plus7 b1 b2 b3 b4  b5 b6 b7 ) b8  ))
(define-fun plus9 ((b1 Int) (b2 Int) (b3 Int) (b4 Int) (b5 Int) (b6 Int) (b7 Int) (b8 Int ) (b9 Int)  ) Int (+  ( plus8 b1 b2 b3 b4 b5 b6 b7 b8 ) b9 ))

(define-fun or3 ((b1 Bool) (b2 Bool) (b3 Bool)) Bool ( or ( or b1 b2) b3))

(define-fun onetimes ((b1 Int )) Int   b1 )  
(define-fun twotimes ((b1 Int )) Int ( plus2 b1 b1 ))  
(define-fun threetimes ((b1 Int )) Int ( plus3 b1 b1 b1 ))  
(define-fun fivetimes  ((b1 Int )) Int ( plus5 b1 b1 b1 b1 b1 ))
(define-fun sixtimes  ((b1 Int )) Int ( plus6 b1 b1 b1 b1 b1 b1 ))
(define-fun seventimes ((b1 Int )) Int ( plus7 b1 b1 b1 b1 b1 b1 b1 ))
(define-fun ninetimes  ((b1 Int )) Int ( plus9 b1 b1 b1 b1 b1 b1 b1 b1 b1))

(define-fun minus ((b1 Int)) Int ( - 0  b1 ))

(declare-var x Int ) 
(declare-var y Int ) 

  

(constraint ( iteB  ( >= x 5 ) ( = ( ex x y ) ( plus3 (fivetimes x ) (threetimes y) 17 ) ) ( = (ex x y ) ( plus2 (threetimes x) 1 ) ) ))



(check-synth)

