"Filed out from Dolphin Smalltalk"!

Object subclass: #Call
	instanceVariableNames: 'duration day origin startTime date'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Call guid: (GUID fromString: '{21df2f8f-0d7d-493f-85a8-71818783a4c7}')!
Call comment: ''!
!Call categoriesForClass!Kernel-Objects! !
!Call methodsFor!

cost
"Returns 0 by default in base classs"
^0!

date
"Return date of call"
	^date!

day
	"Returns the day of the call"
	^day!

duration 
"Returns the duration of the call"
	^duration!

loadCall: aDuration day: aDay origin: aOrigin startTime: aTime
	"Initialize the call with its duration, type, source, and destination"
	super initialize.
	duration := aDuration.
	day := aDay .
	origin := aOrigin.
	startTime := aTime.
	date := Date today.!

origin
"Return the origin of teh call"
	^origin!

startTime
"Returns start time of the call"
	^ startTime! !
!Call categoriesForMethods!
cost!public! !
date!public! !
day!public! !
dayName!public! !
duration!public! !
loadCall:day:origin:startTime:!public! !
origin!public! !
startTime!public! !
!

