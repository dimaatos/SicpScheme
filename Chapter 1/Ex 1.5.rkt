#lang racket

; Упражнение 1.5.
; Бен Битобор придумал тест для проверки интерпретатора на то, с каким порядком вычислений он
; работает, аппликативным или нормальным. Бен определяет такие две процедуры:
; (define (p) (p))
; (define (test x y)
; (if (= x 0)
;     0
;     y))
;
; Затем он вычисляет выражение
; (test 0 (p))
; Какое поведение увидит Бен, если интерпретатор использует аппликативный порядок вычислений?
; Какое поведение он увидит, если интерпретатор использует нормальный порядок? Объясните Ваш
; ответ. (Предполагается, что правило вычисления особой формы if одинаково независимо от того,
; какой порядок вычислений используется. Сначала вычисляется выражение-предикат, и результат
; определяет, нужно ли вычислять выражение-следствие или альтернативу.)
;-------------------------------------------------------------------
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))
;-------------------------------------------------------------------
; Итак пройдемся по всем орпделениям процедур:
; Процедура p - вызывает сама себя, то есть она рекурсивная, а так как
; условия выхода нет, при ее применении она будет вызывать себя рекурсивно пока, мы не прервем нашу программу.
; Или пока не закончиться память для нее, и не произойдет ошибка.
;
; Процедура test
; В зависимости от аргументов она возвращает 0 или 2й формальный параметр.
;
; Вызов (test 0 (p)) при аппликативном порядке вычисления приводит к зацикливанию программы.
; Так как чтобы применить оператор к аргументам, компилятор вычисляет аргументы,
; а вычисление (р) приведет к постоянному рекурсивному вызову самой себя.
;
; При нормальном порядке вычисления идет подстановка, пока мы не дойдем к тому,
; что останутся элементарные операции и выражения и только тогда происходит вычисление.
; Подставляем:
; (if (= 0 0)
;    0
;    (p))
; 0 = 0, возвращается 0.
; Если передать не нулевое значение, то возвратиться примененная процедура (р)
; и произойдет зацикливание.
;===================================================================