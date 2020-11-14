# Operation-ALU
This project required us to implement something similiar to the shift key on a keyboard with the slide switches on the Basys 3 board.
There are only 16 switches and we had to utilize more than 16 switches for input.
Combineed 4 patterns Generation Unit with Alien Operations ALU in a unified integrated system.
The Alien Operation ALU had 5 operations, an 8-bit accumulator that accumulated over 6 clock cycles, a Gray(A) + Gray(B) adder,
a Gray(A+B) adder, a Gray(A)-Gray(B) subtractor, and a Gray(A-B) subtractor.
The 4 patterns Generation Unit already had an odd number generator, even number generator, prime number generator, and a basic 0-15 counter.
The Generation Unit got an additonal 4-bit ring counter, 4-bit johnson counter, and a 4-bit gray code generator.
The entire generation unit was dual direction so it could indivdually generate in ascending or descending order based on slide switch inputs.
The results would be displayed on a 7-segment display and since there were 12 different kinds of outputs, switches had to be used to control
which output would be displayed.
