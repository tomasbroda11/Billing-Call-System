"Filed out from Dolphin Smalltalk"!

Call subclass: #NationalCall
	instanceVariableNames: 'destination'
	classVariableNames: 'DESTINATION_COSTS'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
NationalCall guid: (GUID fromString: '{377a348b-672b-4d4b-a5e4-17888475f749}')!
NationalCall comment: ''!
!NationalCall categoriesForClass!Kernel-Objects! !
!NationalCall methodsFor!

cost
	"Calculate total cost based on destination"
	| costPerMinute aDuration |
	aDuration := super duration.
	costPerMinute := self costPerMinuteForDestination.
	^ aDuration * costPerMinute!

costPerMinuteForDestination
    "Calculate the cost per minute of national calls depending the destination location."
	| costPerMinute aDestination|
	aDestination := self destination.
	DESTINATION_COSTS := Dictionary new.
	DESTINATION_COSTS
		at: 'Buenos Aires' put: 0.20;
		at: 'Cordoba' put: 0.28;
		at: 'Rosario' put: 0.22;
		at: 'Mendoza' put: 0.25;
		at: 'Mar del Plata' put: 0.30.
	costPerMinute := DESTINATION_COSTS at: aDestination ifAbsent: [0.40]. "If the destination of call is not in the list, call's cost will take a default price (0.40 here)"
	^ costPerMinute!

destination
"Retruns destination of national call"
	^ destination!

loadCall: aDuration day: aDay origin: aOrigin startTime: aTime destination: aDestination
"Initialize national calls"
	self loadCall: aDuration day: aDay origin: aOrigin startTime: aTime.
	destination := aDestination.! !
!NationalCall categoriesForMethods!
cost!public! !
costPerMinuteForDestination!public! !
destination!public! !
loadCall:day:origin:startTime:destination:!public! !
!

