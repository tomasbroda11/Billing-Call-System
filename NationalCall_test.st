|factura natCall1 natCall2 |

factura := Bill new.
factura initialize.

natCall1 := NationalCall new.
natCall2 := NationalCall new.

natCall1 loadCall: 30 day: 4 origin: 'casilda 'startTime: '9'destination: 'Mendoza'.
natCall2 loadCall: 11 day: 7 origin: 'Rosario' startTime: 11 destination: 'Buenos Aires'.

factura addCall: natCall1.
factura addCall: natCall2.


Transcript show: 'Date: ', (natCall1 date) printString ; cr.
Transcript show: 'Duration: ', natCall1 duration printString, ' minutes'; cr.
Transcript show: 'Hour: ', natCall1 startTime printString, 'hs'; cr.
Transcript show: 'Origin: ', natCall1 origin; cr.
Transcript show: 'Destination: ', (natCall1 destination); cr.
Transcript show: 'The cost per minute is: ', (natCall1 costPerMinuteForDestination ) printString; cr.
Transcript show: 'Cost of call 1 is: $', (natCall1 cost) printString; cr.
Transcript show: '-------------------'; cr.
Transcript show: 'Date: ', (natCall2 date) printString ; cr.
Transcript show: 'Duration: ', natCall2 duration printString, ' minutes'; cr.
Transcript show: 'Hour: ', natCall2 startTime printString, 'hs'; cr.
Transcript show: 'Origin: ', natCall2 origin; cr.
Transcript show: 'Destination: ', (natCall2 destination); cr.
Transcript show: 'El The cost per minute is: ', (natCall2 costPerMinuteForDestination  ) printString; cr.
Transcript show: 'Cost of call 2 is: $', (natCall2 cost) printString; cr.
Transcript show: '-------------------'; cr.
Transcript show: 'Basic rate: $', factura basicFee printString; cr.
Transcript show: 'Total cost of calls: $', factura totalCost printString; cr.
Transcript show: 'Total cost of bill: $', (factura totalCost + factura basicFee )printString; cr.
Transcript show: '-------------------'; cr.
