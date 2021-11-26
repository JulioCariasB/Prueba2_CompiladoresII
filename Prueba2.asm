.globl main

main:
li		$v0, 8		# $v0 = 8 syscall read string
syscall
la		$t0, $a0    # load string address
li		$t4, 0		# $t4 = 0 vowels counter

loop:
lb      $t2, 0($t0) # load char a t2
beq		$t2, $zero, finish	# if $t2 == $zero then finish

li      $t3, 97     # $t3 = 'a'
beq		$t2, $t3, increment	# if $t2 == $t3 then increment
li      $t3, 101    # $t3 = 'e'
beq		$t2, $t3, increment	# if $t2 == $t3 then increment
li      $t3, 105    # $t3 = 'i'
beq		$t2, $t3, increment	# if $t2 == $t3 then increment
li      $t3, 111    # $t3 = 'o'
beq		$t2, $t3, increment	# if $t2 == $t3 then increment
li      $t3, 117    # $t3 = 'u'
beq		$t2, $t3, increment	# if $t2 == $t3 then increment
j		end_loop				# jump to end_loop

increment:
addi	%t4, $t4, 1			# %t4 = $t4 + 1

end_loop:
addi    $t0, $t0, 1         # move to next char
j		loop				# jump to loop


finish:
li		$v0, 1		        # $v0 = 1 syscall print int
addi	$a0, $t4, 0			# $a0 = $t4 + 0 print vowels
syscall

li      $v0, 10             # finish program
syscall