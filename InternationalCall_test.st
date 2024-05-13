| factura intCall1 intCall2 totalAmount |

factura := Bill new.
factura initialize.

intCall1 := InternationalCall new.
intCall2 := InternationalCall new.

intCall1 loadCall: 7 day: 2 origin: 'Pujato' startTime: 4 destination: 'Japan'.
intCall2 loadCall: 2 day: 7 origin: 'Rosario' startTime:  18 destination: 'USA'.

factura addCall: intCall1.
factura addCall: intCall2.

Transcript show: 'The cost per minute is: ', (intCall1 costPerMinuteInternational ) printString; cr.
Transcript show: 'Cost of call 1 is: $', (intCall1 cost) printString; cr.
Transcript show: '-------------------'; cr.
Transcript show: 'El The cost per minute is: ', (intCall2 costPerMinuteInternational ) printString; cr.
Transcript show: 'Cost of call 2 is: $', (intCall2 cost) printString; cr.
Transcript show: '-------------------'; cr.
Transcript show: 'Basic rate: $', factura basicFee printString; cr.
Transcript show: 'Total calls cost is: $', (factura totalCost ) printString; cr.
Transcript show: 'Total cost of bill: $', (factura totalCost + factura basicFee )printString; cr.
