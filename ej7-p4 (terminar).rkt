(require 2htdp/image)
(require 2htdp/universe)

(define AUTO .)
(define ANCHO_AUTO (image-width AUTO))
(define ALTO_AUTO (image-height AUTO))

(define ANCHO_ESCENA 800)
(define ALTO_ESCENA 200)
(define ESCENA (empty-scene ANCHO_ESCENA ALTO_ESCENA))

;AUTO es (Number, Number)
;Interpretacion: El primer elemento es la posicion horizontal del auto,
;mientras que el segundo representa la velocidad expresada en pixeles sobre tick.
(define-struct Auto [hpos vel])

(define TICK_MOVE 3) ;Cantidad de pixeles que se mueve el auto por tick.

(define INICIAL (make-VARS 50 3))

;INTERPRETAR: Estado, Number -> Image, Number
(define (INTERPRETAR n) (if (VARS? n)
                            (place-image AUTO (VARS-hpos n) 100 ESCENA)
                            (place-image AUTO n 100 ESCENA)))

;MOVIMIENTO: VARS, Number -> Number
(define (MOVIMIENTO n) (if (VARS? n)
                           (if (> 750 (VARS-hpos n)) (+ (VARS-hpos n) (VARS-vel n)) (VARS-hpos n))
                           (if (> 750 n) (+ n (VARS-vel INICIAL))  n)))

(define (KEY-CONTROLER n k)
  (cond
    [(key=? k " ") (VARS-hpos INICIAL)]
    [(key=? k "right") (if (< n 750) (+ n 20) n)]
    [(key=? k "left") (if (< 50 n) (- n 20) n)]
    [(key=? k "up") (define HOLA 1)]
    [else n]))

(define (DIRECTOR n x y e)
  (cond
    [(mouse=? e "button-down") x]
    [else n]))

(big-bang INICIAL
  [to-draw INTERPRETAR]
  [on-tick MOVIMIENTO]
  [on-key KEY-CONTROLER]
  ;[on-mouse DIRECTOR]
  )
