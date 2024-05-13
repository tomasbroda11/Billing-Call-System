"Filed out from Dolphin Smalltalk"!

Object subclass: #Bill
	instanceVariableNames: 'basicMonthlyFee calls'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Bill guid: (GUID fromString: '{fd853cff-d3a6-41a2-b20b-6e0ba793feda}')!
Bill comment: ''!
!Bill categoriesForClass!Kernel-Objects! !
!Bill methodsFor!

addCall: aCall
"Adding a call to the bill."
	calls add: aCall.!

basicFee
"Returns the basic amount for every fee"
	^basicMonthlyFee!

calls
"Returns calls from a Bill"
	^calls!

initialize
    "Initialize the bill with a basic monthly fee and an empty list of calls"
	super initialize.
	basicMonthlyFee := 15.45 . "Let's assume a basic rate per bill"
	calls := OrderedCollection new.

!

numberOfCalls
"Return the amount of calls per bill."
	^ calls size.!

showBill
"Print the bill in a friendly format"
	"Print the bill in a friendly format"
	| aBill |
	aBill := self.
	Transcript show: 'Detailed Bill'; cr.
	Transcript show: '-------------------'; cr.

	Transcript show: 'Date: ', Date today printString; cr.
	Transcript show: 'Call Details:'; cr.
	Transcript show: '-------------------'; cr.
	aBill  calls do: [:aCall |
	    Transcript show: 'Type: ', (aCall class name); cr.
	    Transcript show: 'Date: ', (aCall date) printString ; cr.
	    Transcript show: 'Duration: ', aCall duration printString, ' minutes'; cr.
	    "Transcript show: 'Day: ', ((aCall dayName) asString) printString; cr."
	    Transcript show: 'Hour: ', aCall startTime printString, 'hs'; cr.

	    (aCall isKindOf: LocalCall) ifTrue: [
		Transcript show: 'Origin: ', aCall origin; cr.
		Transcript show: 'Cost Per Minute: ', (aCall businessCost ) printString; cr.
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

	Transcript show: 'Basic rate: $', aBill  basicFee printString; cr.
	Transcript show: 'Total cost of calls: $', aBill  totalCost printString; cr.
	Transcript show: 'Total cost of bill: $', (aBill  totalCost + aBill  basicFee )printString; cr.
	Transcript show: '-------------------'; cr.
	Transcript show: 'Thank you for your preference!!'; cr.
	Transcript show: '-------------------'; cr.
!

totalCost
	"Calculate the total cost of the bill. totalCost will be equal the sum of the basic monthly fee and the cost of the calls"
	| totalCost |
	totalCost := 0.
	calls do: [ :aCall |
		totalCost := totalCost + aCall cost.
		].
	^ totalCost.! !
!Bill categoriesForMethods!
addCall:!public! !
basicFee!public! !
calls!public! !
initialize!public! !
numberOfCalls!public! !
showBill!public! !
totalCost!public! !
!

