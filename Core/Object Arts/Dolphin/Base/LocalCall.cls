"Filed out from Dolphin Smalltalk"!

Call subclass: #LocalCall
	instanceVariableNames: ''
	classVariableNames: 'BUSINESS_COST NORMAL_COST WEEKEND_COST'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
LocalCall guid: (GUID fromString: '{56af0736-31c9-482c-9eb4-75389ed7a7f7}')!
LocalCall comment: ''!
!LocalCall categoriesForClass!Kernel-Objects! !
!LocalCall methodsFor!

businessCost
"Return business cost"
	^BUSINESS_COST!

cost
    "Calculate the cost of the local call based on the hour of the day and doy of the week"
	| callDuration callDay  costPerMinute |
	callDuration := super duration.
	callDay := super day.
	costPerMinute := self costPerMinute.
	^ callDuration * costPerMinute
!

costPerMinute
    "Return the cost per minute depending the hour and the day of the week"
	| costPerMinute callDay  startT |
	costPerMinute := 0.10. 
	callDay := super day.
	startT  := super startTime.
	costPerMinute := (startT between: 8 and: 20) "Horario de oficina (lunes a viernes)"
	ifTrue: [
	    (callDay between: 1 and: 5) "Lunes a viernes"
		ifTrue: [costPerMinute := BUSINESS_COST] "Costo de negocio"
		ifFalse: [costPerMinute := NORMAL_COST] "Costo normal"
	]
	ifFalse: [costPerMinute:= WEEKEND_COST]. "Fin de semana"

	^ (costPerMinute) asFloat.!

initialize
"Initialize the cost per minute for local calls "
BUSINESS_COST  := 0.20.
NORMAL_COST := 0.10.
WEEKEND_COST := 0.10.!

normalCost
"Return the value of minute of call out of business time"
	^NORMAL_COST!

weekendCost
"Return the value of minute of call at weekends"
	^WEEKEND_COST! !
!LocalCall categoriesForMethods!
businessCost!public! !
cost!public! !
costPerMinute!public! !
initialize!public! !
normalCost!public! !
weekendCost!public! !
!

