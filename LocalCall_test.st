| bill localCall1 localCall2 totalCost |

"Instantiate Bill"
bill := Bill new.
bill initialize.

"Create a LocalCall instance"
localCall1 := LocalCall new.
localCall1 initialize.
localCall1 loadCall: 11 day: 3 origin: 'Casilda' startTime: 10.15 .

localCall2 := LocalCall new.
localCall2 initialize.
localCall2 loadCall: 2.43 day: 1 origin: 'Entre rios' startTime: 22.14.

"Add the local call to the bill"
bill addCall: localCall1.
bill addCall: localCall2.

Transcript show: 'Cost per minute in call 1: ', (localCall1 costPerMinute) printString; cr.
Transcript show: 'Total cost of call 1: $', (localCall1 cost ) printString; cr.
Transcript show: 'Day: ', (localCall1 date ) printString; cr.
Transcript show: '-------------------'; cr.
Transcript show: 'Cost per minute in call 2: ', (localCall2 costPerMinute) printString; cr.
Transcript show: 'Total cost of call 2: $', (localCall2 cost ) printString; cr.
Transcript show: 'Day: ', ( localCall2 date ) printString; cr.
Transcript show: '-------------------'; cr.
totalCost := localCall1 cost + localCall2 cost.
Transcript show: 'Basic rate: $', bill  basicFee printString; cr.
Transcript show: 'Total cost of calls: $', totalCost printString; cr.
Transcript show: '-------------------'; cr.
Transcript show: 'Total cost of bill: $', (bill  totalCost + totalCost)printString; cr.