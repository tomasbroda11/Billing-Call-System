| bill localCall1 localCall2 localCall3 natCall1 natCall2 natCall3 natCall4 intCall1 intCall2 |

"Instantiate Bill"
bill := Bill new.
bill initialize.
"Create call instances"
localCall1 := LocalCall new.
localCall1 initialize.
localCall1 loadCall: 11 day: 3 origin: 'Casilda' startTime: 10.15 .

localCall2 := LocalCall new.
localCall2 initialize.
localCall2 loadCall: 18 day: 4 origin: 'Casilda' startTime: 13.37 .

localCall3 := LocalCall new.
localCall3 initialize.
localCall3 loadCall: 6 day: 6 origin: 'Casilda' startTime: 21.22 .

natCall1 := NationalCall new.
natCall2 := NationalCall new.
natCall3 := NationalCall new.
natCall4 := NationalCall new.

natCall1 loadCall: 14.20 day: 4 origin: 'Casilda' startTime: 9.05 destination: 'Mendoza'.
natCall2 loadCall: 11.43 day: 7 origin: 'Rosario' startTime: 11.33 destination: 'Buenos Aires'.
natCall3 loadCall: 1.30 day: 7 origin: 'Parana' startTime: 13.15 destination: 'Cordoba'.
natCall4 loadCall: 4.05 day: 2 origin: 'Junin' startTime: 23.05 destination: 'Mar del Plata'.


intCall1 := InternationalCall new.
intCall2 := InternationalCall new.

intCall1 loadCall: 7 day: 2 origin: 'Pujato' startTime: 4.21 destination: 'Japan'.
intCall2 loadCall: 2 day: 7 origin: 'Rosario' startTime: 18.35 destination: 'USA'.

"Add calls to the bill"
bill addCall: localCall1.
bill addCall: localCall2.
bill addCall: localCall3.
bill addCall: natCall1.
bill addCall: natCall2.
bill addCall: natCall3.
bill addCall: natCall4.
bill addCall: intCall1.
bill addCall: intCall2.

"Print the bill in a friendly format"

Transcript show: 'Detailed Bill'; cr.
Transcript show: '-------------------'; cr.

Transcript show: 'Date: ', Date today printString; cr.
Transcript show: 'Call Details:'; cr.
Transcript show: '-------------------'; cr.
bill calls do: [:aCall |
    Transcript show: 'Type: ', (aCall class name); cr.
    Transcript show: 'Date: ', (aCall date) printString ; cr.
    Transcript show: 'Duration: ', aCall duration printString, ' minutes'; cr.
    "Transcript show: 'Day: ', ((aCall dayName) asString) printString; cr."
    Transcript show: 'Hour: ', aCall startTime printString, 'hs'; cr.

    (aCall isKindOf: LocalCall) ifTrue: [
        Transcript show: 'Origin: ', aCall origin; cr.
        Transcript show: 'Cost Per Minute: ', (aCall costPerMinute ) printString; cr.
    ].

    (aCall isKindOf: NationalCall) ifTrue: [
        Transcript show: 'Origin: ', aCall origin; cr.
        Transcript show: 'Destination: ', (aCall destination); cr.
        Transcript show: 'Cost per minute: ', (aCall costPerMinuteForDestination) printString; cr.
    ].

    (aCall isKindOf: InternationalCall) ifTrue: [
        Transcript show: 'Destination Country: ', (aCall destination); cr.
        Transcript show: 'Cost per minutel: ', (aCall costPerMinuteInternational) printString; cr.
    ].

    Transcript show: 'Cost of this call: $', aCall cost printString; cr.
    Transcript show: '-------------------'; cr.
].

Transcript show: 'Basic rate: $', bill basicFee printString; cr.
Transcript show: 'Total cost of calls: $', bill totalCost printString; cr.
Transcript show: 'Total cost of bill: $', (bill totalCost + bill basicFee )printString; cr.
Transcript show: '-------------------'; cr.
Transcript show: 'Thank you for your preference!'; cr.
Transcript show: '-------------------'; cr.
