;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |ex 150|) (read-case-sensitive #t) (teachpacks ((lib "image.ss" "teachpack" "2htdp") (lib "universe.ss" "teachpack" "2htdp") (lib "batch-io.ss" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.ss" "teachpack" "2htdp") (lib "universe.ss" "teachpack" "2htdp") (lib "batch-io.ss" "teachpack" "2htdp")))))
; List-of-lists-of-strings -> String
; Collapse a list where each element represents a line. An empty list
; is a blank line, and a non-empty list is a list of words. Separate
; the lines with a \n character.
(define (collapse-lines line-list)
  (cond [(empty? line-list) "\n"]
        [(empty? (rest line-list)) (string-append (collapse-words (first line-list)) "\n")]
        [else (string-append (collapse-words (first line-list))
                             "\n"
                             (collapse-lines (rest line-list)))]))

(check-expect (collapse-lines empty) "\n")
(check-expect (collapse-lines (list (list "A" "short") empty (list "Poem"))) "A short\n\nPoem\n")

; List-of-strings -> String
; Collapse a list of words into a single string with a space following
; each word.
(define (collapse-words word-list)
  (cond [(empty? word-list) ""]
        [(empty? (rest word-list)) (first word-list)]
        [(string=? (first word-list) "a") (collapse-words (rest word-list))]
        [(string=? (first word-list) "an") (collapse-words (rest word-list))]
        [(string=? (first word-list) "the") (collapse-words (rest word-list))]
        [else (string-append (first word-list)
                             " "
                             (collapse-words (rest word-list)))]))

(check-expect (collapse-words empty) "")
(check-expect (collapse-words (list "A" "little" "list" "of" "words")) "A little list of words")

; String List-of-lists-of-strings -> String
; Write out a list of lists of words to a file with the given filename.
(define (write-words/line filename line-list)
  (write-file filename (collapse-lines line-list)))

(define ttt (read-words/line "ttt.txt"))
(write-words/line "ttt2.txt" ttt)