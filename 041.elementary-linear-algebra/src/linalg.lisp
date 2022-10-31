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

(defun random-equation (n-vars &optional (leading-nonzero -1)
                        &key (coef-low -5) (coef-high 5))
  (let ((result nil))
    (do ((i 0 (1+ i)))
        ((= (1+ n-vars) i) (nreverse result))
      (setq result (cons (random-between coef-low coef-high :nonzero (= leading-nonzero i)) result)))))

(defun random-system-of-equations (n-vars n-equations &key (wiggle 1))
  (let ((result nil))
    (do ((i 0 (1+ i))
         (coef-high (+ wiggle n-equations) (1- coef-high))
         (coef-low (- (+ wiggle n-equations)) (1+ coef-low)))
        ((= (1+ n-equations) i) (nreverse result))
      (setq result (cons (random-equation n-vars i :coef-low coef-low :coef-high coef-high) result)))))