; function to count how many bits are set in a string of bytes
; INPUT:
; hl = address of string of bytes
; b = length of string of bytes
; OUTPUT:
; a = [wNumSetBits] = number of set bits
; hl = address after string of bytes
; bc = 0, de preserved
CountSetBits:: ; marcelnote - optimized
	xor a      ; a = running total
.byteLoop
	ld c, [hl] ; c = next byte
	inc hl
	add c
	add c      ; a = total + 2c
.bitLoop       ; use formula  numbits = 2c - c - c/2 - c/4 - ... - c/256, explained below
	sub c      ; subtract c, c/2, c/4, ...
	srl c
	jr nz, .bitLoop
	dec b
	jr nz, .byteLoop
	ld [wNumSetBits], a
	ret

; EXPLANATION
;
; Consider the number xk * 2^k where xk is 0 or 1.
; Use the geometric sum
;   sum_{i=0}^k 2^i = 2^{k+1} - 1
; to obtain
;   xk = xk * ( 2^{k+1} - sum_{i=0}^k 2^{k-i} ) = xk * (2^{k+1} - 2^k - 2^{k-1} - ... - 1).
; Thus if
;   x = sum_{k=0}^K xk * 2^k
; we have
;   sum_{k=0}^K xk = sum_{k=0}^K xk * (2^{k+1} - sum_{i=0}^k 2^{k-i})
;                  = 2x - sum_{k=0}^K sum_{i=0}^k xk 2^{k-i}
;                  = 2x - sum_{0 ≤ i ≤ k ≤ K} xk 2^{k-i}
;                  = 2x - sum_{i=0}^K sum_{k=i}^K xk 2^{k-i}
; but this last term is just
;   sum_{k=i}^K xk * 2^{k-i} = x/2^i
; hence the formula
;   sum_{k=0}^K xk = 2x - (x + x/2 + x/4 + ... + x/2^K).
