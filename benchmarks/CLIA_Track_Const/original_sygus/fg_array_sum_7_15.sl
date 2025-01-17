(set-logic LIA)
(synth-fun findSum ( (y1 Int) (y2 Int) (y3 Int) (y4 Int) (y5 Int) (y6 Int) (y7 Int) )Int ((Start Int (  
    3 
		y1 y2 y3 y4 y5 y6 y7
             (+ Start Start)
             (ite StartBool Start Start)))
 (StartBool Bool (           (not StartBool) (or StartBool)       (>= Start Start) (and StartBool StartBool) ))
))
(declare-var x1 Int)
(declare-var x2 Int)
(declare-var x3 Int)
(declare-var x4 Int)
(declare-var x5 Int)
(declare-var x6 Int)
(declare-var x7 Int)
(constraint (=> (> (+ x1 x2) 15) (= (findSum x1 x2 x3 x4 x5 x6 x7 ) (+ x1 x2))))
(constraint (=> (and (<= (+ x1 x2) 15) (> (+ x2 x3) 15)) (= (findSum x1 x2 x3 x4 x5 x6 x7 ) (+ x2 x3))))
(constraint (=> (and (and (<= (+ x1 x2) 15) (<= (+ x2 x3) 15)) (> (+ x3 x4) 15)) (= (findSum x1 x2 x3 x4 x5 x6 x7 ) (+ x3 x4))))
(constraint (=> (and (and (<= (+ x1 x2) 15) (and (<= (+ x2 x3) 15) (<= (+ x3 x4) 15))) (> (+ x4 x5) 15)) (= (findSum x1 x2 x3 x4 x5 x6 x7 ) (+ x4 x5))))
(constraint (=> (and (and (<= (+ x1 x2) 15) (and (<= (+ x2 x3) 15) (and (<= (+ x3 x4) 15) (<= (+ x4 x5) 15)))) (> (+ x5 x6) 15)) (= (findSum x1 x2 x3 x4 x5 x6 x7 ) (+ x5 x6))))
(constraint (=> (and (and (<= (+ x1 x2) 15) (and (<= (+ x2 x3) 15) (and (<= (+ x3 x4) 15) (and (<= (+ x4 x5) 15) (<= (+ x5 x6) 15))))) (> (+ x6 x7) 15)) (= (findSum x1 x2 x3 x4 x5 x6 x7 ) (+ x6 x7))))
(constraint (=> (and (<= (+ x1 x2) 15) (and (<= (+ x2 x3) 15) (and (<= (+ x3 x4) 15) (and (<= (+ x4 x5) 15) (and (<= (+ x5 x6) 15) (<= (+ x6 x7) 15)))))) (= (findSum x1 x2 x3 x4 x5 x6 x7 ) 0)))
(check-synth)
