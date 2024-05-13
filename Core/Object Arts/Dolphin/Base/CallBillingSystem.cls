"Filed out from Dolphin Smalltalk"!

Object subclass: #CallBillingSystem
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
CallBillingSystem guid: (GUID fromString: '{70b94333-3c65-4580-bdb8-c74ee873ed8f}')!
CallBillingSystem comment: ''!
!CallBillingSystem categoriesForClass!Kernel-Objects! !
!CallBillingSystem class methodsFor!

run 
"Main method to run the call billing system."
	| bill localCall totalCost |

	"Crear una instancia de Bill"
	bill := Bill new.
	Transcript show: 'Bill creada con éxito.'; cr.

	"Imprimir la instancia de Bill para verificar que se haya creado correctamente"


	"Crear una instancia de LocalCall"
	localCall := LocalCall new.
	localCall initializeDuration: 16 type: 'Local' origin: 'Casilda'.
	Transcript show: 'LocalCall creada con éxito.'; cr.

	"Imprimir la instancia de LocalCall para verificar que se haya creado correctamente"
	Transcript show: 'Instancia de LocalCall: ', localCall printString; cr.

	"Agregar la llamada local a la factura"
	Transcript show: 'Agregando llamada local al bill...'; cr.
	Transcript show: 'Cantidad de llamadas en bill antes de agregar: ', bill calls size printString; cr.
	bill addCall: localCall.
	Transcript show: 'Llamada local añadida correctamente.'; cr.
	Transcript show: 'Cantidad de llamadas en bill después de agregar: ', bill calls size printString; cr.

	"Calcular el costo total de la factura"
	totalCost := bill totalCost.
! !
!CallBillingSystem class categoriesForMethods!
run!public! !
!

