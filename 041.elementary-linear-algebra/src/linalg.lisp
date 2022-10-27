(defun warmup-rng ()
  "It's a good idea to generate a few hundred or few thousand random
  numbers before using the random number generator.

See: http://www0.cs.ucl.ac.uk/staff/d.jones/GoodPracticeRNG.pdf"
  (setf *random-state* (make-random-state t))
  (dotimes (i 2048)
    (random 4096)))

(defun random-bool ()
  (zerop (mod (random 4096) 2)))

(defun random-between (low high &key nonzero)
  "Inclusive random number between low and high"
  (let* ((delta (1+ (- high low)))
         (result (+ low (random delta))))
    (do ((result (+ low (random delta)) (+ low (random delta))))
        ((or (not nonzero) (not (zerop result)))
         result))))

