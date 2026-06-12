Algoritmo Torneo_De_Robots
	
	// DECLARACIÓN DE VARIABLES
	Definir modeloR1, modeloR2 Como Cadena
	Definir tipoR1, tipoR2 Como Cadena
	
	Definir blindajeR1, blindajeR2 Como Entero
	Definir potenciaR1, potenciaR2 Como Entero
	Definir reflejosR1, reflejosR2 Como Real
	Definir escudoR1, escudoR2 Como Entero
	Definir sistemaR1, sistemaR2 Como Entero
	
	Definir prioridadR1, prioridadR2 Como Real
	Definir impactoR1, impactoR2 Como Real
	Definir extraR1, extraR2 Como Real
	
	// ROBOT 1
	modeloR1 <- "Titan X"
	tipoR1 <- "Pesado"
	blindajeR1 <- 150
	potenciaR1 <- 95
	reflejosR1 <- 6.5
	escudoR1 <- 80
	sistemaR1 <- 90
	
	// ROBOT 2
	modeloR2 <- "Phantom Z"
	tipoR2 <- "Ligero"
	blindajeR2 <- 120
	potenciaR2 <- 75
	reflejosR2 <- 9.5
	escudoR2 <- 60
	sistemaR2 <- 95
	
	// MOSTRAR FICHAS
	Escribir "=============================="
	Escribir "ROBOT 1: ", modeloR1
	Escribir "Tipo: ", tipoR1
	Escribir "Blindaje: ", blindajeR1
	Escribir "Potencia: ", potenciaR1
	Escribir "Reflejos: ", reflejosR1
	Escribir "Escudo: ", escudoR1
	Escribir "Sistema: ", sistemaR1
	
	Escribir ""
	
	Escribir "ROBOT 2: ", modeloR2
	Escribir "Tipo: ", tipoR2
	Escribir "Blindaje: ", blindajeR2
	Escribir "Potencia: ", potenciaR2
	Escribir "Reflejos: ", reflejosR2
	Escribir "Escudo: ", escudoR2
	Escribir "Sistema: ", sistemaR2
	Escribir "=============================="
	
	// CALCULAR INICIATIVA
	prioridadR1 <- (potenciaR1 + reflejosR1 * 10) / 2
	prioridadR2 <- (potenciaR2 + reflejosR2 * 10) / 2
	
	Escribir ""
	Escribir "Prioridad ", modeloR1, ": ", prioridadR1
	Escribir "Prioridad ", modeloR2, ": ", prioridadR2
	
	// DAÑO BASE
	impactoR1 <- potenciaR1 - (escudoR2 * 0.30)
	impactoR2 <- potenciaR2 - (escudoR1 * 0.30)
	
	// BONO CRÍTICO
	extraR1 <- sistemaR1 * 0.10
	extraR2 <- sistemaR2 * 0.10
	
	impactoR1 <- impactoR1 + extraR1
	impactoR2 <- impactoR2 + extraR2
	
	// QUIÉN ATACA PRIMERO
	Si prioridadR1 > prioridadR2 Entonces
		
		blindajeR2 <- blindajeR2 - Trunc(impactoR1)
		
		Si blindajeR2 > 0 Entonces
			blindajeR1 <- blindajeR1 - Trunc(impactoR2)
		FinSi
		
	Sino
		
		blindajeR1 <- blindajeR1 - Trunc(impactoR2)
		
		Si blindajeR1 > 0 Entonces
			blindajeR2 <- blindajeR2 - Trunc(impactoR1)
		FinSi
		
	FinSi
	
	// RESULTADOS
	Escribir ""
	Escribir "Impacto de ", modeloR1, ": ", Trunc(impactoR1)
	Escribir "Impacto de ", modeloR2, ": ", Trunc(impactoR2)
	
	Escribir ""
	Escribir "Blindaje restante de ", modeloR1, ": ", blindajeR1
	Escribir "Blindaje restante de ", modeloR2, ": ", blindajeR2
	
	// DETERMINAR GANADOR
	Escribir ""
	
	Si blindajeR1 > blindajeR2 Entonces
		Escribir "CAMPEON DEL TORNEO: ", modeloR1
		Escribir "Ventaja final: ", blindajeR1 - blindajeR2, " puntos"
	Sino
		Si blindajeR2 > blindajeR1 Entonces
			Escribir "CAMPEON DEL TORNEO: ", modeloR2
			Escribir "Ventaja final: ", blindajeR2 - blindajeR1, " puntos"
		Sino
			Escribir "EMPATE TECNICO EN LA ARENA"
		FinSi
	FinSi
	
FinAlgoritmo