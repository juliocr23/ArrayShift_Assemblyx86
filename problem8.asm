COMMENT*
     Julio Rosario 3/20/17
	   Using a loop and indexed addressing, write code that rotates the members of a 32-bit integer
	array forward one position. The value at the end of the array must wrap around to the first position.
	For example, the array [10,20,30,40] would be transformed into [40,10,20,30].
*COMMENT

INCLUDE  Irvine32.inc

.data
array DWORD 10,20,30,40

COMMENT*
   Algorithm :
           put 40 into temp
		 put 30 into 40
		 put 20 into 30
		 put 10 into 20
		 put temp into 10
*COMMENT 

.code

main PROC
		
         MOV ECX,LENGTHOF array     ;Set the number of iteration
	    MOV ESI,OFFSET array + SIZEOf array - TYPE array   ;Start pointer at last position.
	    MOV EBX,0
	  
	    MOV EAX,array+SIZEOF array - TYPE array ;Store the last element into EAX 

	    shiftElement: 
	                
				  sub ESI,TYPE array   

				  MOV EBX,[ESI]     
				  add ESI,TYPE array

				  MOV [ESI],EBX      

                      sub ESI,TYPE array  
	    LOOP shiftElement

	     MOV array,EAX   ;Put temp into 10

	   MOV ECX, LENGTHOF array
	   MOV ESI, OFFSET array

	    print:
			MOV EAX,[ESI]
			add ESI,TYPE array
			call writedec
			call crlf
	    loop print
exit
main ENDP
end main 