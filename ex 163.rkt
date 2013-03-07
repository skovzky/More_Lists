;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |ex 163|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;robert heemann (THE GREAT VLADIMIR SKOVZKY)
;EX 163: Design a Program that sorts you mail by date

(define-struct mail (from date message))
; A Mail Message is a structure:
; – (make-mail String Number String)
; interp. (make-mail f d m) represents text m sent by
; f, d seconds after the beginning of time

(define sort-mail mail-list
  (cond
    [(empty? mail-list) empty]
    [else
     (sorter (first mail-list) (sort-mail (rest mail-list)))]))