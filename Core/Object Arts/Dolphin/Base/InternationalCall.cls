"Filed out from Dolphin Smalltalk"!

Call subclass: #InternationalCall
	instanceVariableNames: 'destinationCountry'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
InternationalCall guid: (GUID fromString: '{aa9cbc2e-a25d-4a90-92cb-3d751d4d1373}')!
InternationalCall comment: ''!
!InternationalCall categoriesForClass!Kernel-Objects! !
!InternationalCall methodsFor!

cost 
"Calculate international call cost based on destination and country"
	| costPerMinute aDuration |
	aDuration := duration.
	costPerMinute := self costPerMinuteInternational.
	^aDuration * costPerMinute
!

costPerMinuteInternational
	" Calculate cost per minute for an international call based on destuination country."
	| costPerMinute countryCosts destCountry |
	destCountry := self destination.
	countryCosts := Dictionary new.
	countryCosts
		at: 'USA' put: 0.50;
		at: 'Brazil' put: 0.44;
		at: 'Spain' put: 0.58;
		at: 'France' put: 0.60;
		at: 'Japan' put: 0.81;
		at: 'India' put: 0.75;
		at: 'Canada' put: 0.53;
		at: 'UK' put: 0.65.
	costPerMinute := countryCosts at: destCountry ifAbsent: [0.90].	"If the destination country does not match any counrty in the pre loaded list, cost per minute will be a default cost (0.90 in this case)."
	^costPerMinute!

destination
"Returns destination country of the call"
	^ destinationCountry!

loadCall: aDuration day: aDay origin: aOrigin startTime: aTime destination: aDestination
"Initialize national calls"
	self loadCall: aDuration day: aDay origin: aOrigin startTime: aTime.
	destinationCountry := aDestination.! !
!InternationalCall categoriesForMethods!
cost!public! !
costPerMinuteInternational!public! !
destination!public! !
loadCall:day:origin:startTime:destination:!public! !
!

