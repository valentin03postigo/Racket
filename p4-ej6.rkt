;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname p4-ej6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define ANCHO 400)

(define ALTO 400)

(define DELTA 3)

(define MOSCA (circle 10 "solid" "brown"))

(define INICIAL (make-posn (/ ANCHO 2) (/ ALTO 2)))

(define (INTERPRETAR n) (place-image MOSCA (posn-x n) (posn-y n) (empty-scene ANCHO ALTO)))

(define (MOVIMIENTO n) (if (= (random 10) 2)
                       (if (= (random 10) 2)
                           (make-posn (if (>= (posn-x n) 400)
                                          (posn-x n)
                                          (+ (posn-x n) DELTA)) (posn-y n))
                           (make-posn (posn-x n) (if (<= (posn-y n) 390)
                                                     (posn-y n)
                                                     (+ (posn-y n) DELTA))))
                       (if (= (random 10) 2)
                           (make-posn (if (<= (posn-x n) 10)
                                          (posn-x n)
                                          (- (posn-x n) DELTA)) (posn-y n))
                           (make-posn (posn-x n) (if (<= (posn-y n) 10)
                                                     (posn-y n)
                                                     (- (posn-y n) DELTA))))))

(define 

;interpretar: Estado -> Image
(big-bang INICIAL
  [to-draw INTERPRETAR]
  [on-tick MOVIMIENTO])