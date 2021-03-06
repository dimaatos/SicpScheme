#lang racket

; Упражнение 1.43.
; Если f есть численная функция, а n — положительное целое число, то мы можем построить
; n-кратное применение f, которое определяется как функция, значение которой в точке x равно
; f(f(. . . (f(x)) . . .)). Например, если f есть функция x 7→ x + 1, то n-кратным применением f
; будет функция x 7→ x + n. Если f есть операция возведения в квадрат, то n-кратное применение
; f есть функция, которая возводит свой аргумент в 2n-ю степень. Напишите процедуру, которая
; принимает в качестве ввода процедуру, вычисляющую f, и положительное целое n, и возвращает
; процедуру, вычисляющую n-кратное применение f. Требуется, чтобы Вашу процедуру можно было
; использовать в таких контекстах:
; ((repeated square 2) 5)
; 625
; Подсказка: может оказаться удобно использовать compose из упражнения 1.42.
;------------------------------------------------------------------
(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x) (* x x))
(define (inc x) (+ x 1))

(define (repeated f n)
 (lambda (x)
   (define (iter result counter)
     (if (= counter n)
         result
         (iter (f result) (inc counter))))
   (iter (f x) 1)))

((repeated square 2) 5)
((repeated inc 10) 5)
;==================================================================