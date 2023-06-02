;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname p3-ej7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define ANCHO 800)

(define ALTO 200)

(define AUTO (rectangle 90 50 "solid" "red"))

(define DELTA 3)

(define INICIAL 50)

(define ESCENA (empty-scene ANCHO ALTO))

(define (INTERPRETAR n) (place-image AUTO n 100 ESCENA))

(define (MOVIMIENTO n) (if (> 750 n) (+ n DELTA) n))

(define (RESET n k)
  (cond
    [(key=? k " ") INICIAL]
    [(key=? k "right") (if (< n 750) (+ n 20) n)]
    [(key=? k "left") (if (< 50 n) (- n 20) n)]
    [else n]))

(define (DIRECTOR n x y e)
  (cond
    [(mouse=? e "button-down") x]
    [else n]))

(big-bang INICIAL
  [to-draw INTERPRETAR]
  [on-tick MOVIMIENTO]
  [on-key RESET]
  [on-mouse DIRECTOR])

