//This file was generated from (Academic) UPPAAL 4.0.10 (rev. 4417), September 2009

/*
R1  -- Comment --- Exits a final state where manual_to_abort == 1
*/
E<> manual_to_abort==1

/*
A state where Plane.Abort is reachable
*/
E<> Plane.Abort

/*
A state where the Plane.Ok is reachable
*/
E<> Plane.Ok

/*
There should exist a maximal path such that (manual_to_abort == 0 or (auto_to_abort_airspeed == 0 && auto_to_abort_accelaration == 0)
*/
E[] Plane.Abort imply (manual_to_abort == 0 or (auto_to_abort_airspeed == 0 && auto_to_abort_accelaration == 0))

/*
There should exist a maximal path such that (manual_to_abort == 1 && ( auto_to_abort_airspeed == 1 or auto_to_abort_accelaration == 1).

*/
E[] Plane.Ok imply (manual_to_abort == 1 && ( auto_to_abort_airspeed == 1 or auto_to_abort_accelaration == 1))

/*
If the signal for take off is given, then the plane will take off or abort
*/
Plane.TakeOff --> Plane.Ok or Plane.Abort

/*
R3
*/
E<> Plane.TakeOff and (auto_to_abort_airspeed == 1 or auto_to_abort_airspeed == 0)

/*
R2
*/
E<> Plane.TakeOff and (auto_to_abort_accelaration == 1 or auto_to_abort_accelaration == 0)

/*
R4
*/
E[] Plane.Abort imply manual_to_abort == 0

/*
R5
*/
E<> Plane.Abort imply (manual_to_abort == 0 or (auto_to_abort_airspeed == 0 && auto_to_abort_accelaration == 0))

/*

*/
E[] Plane.Abort and (manual_to_abort == 1 or (auto_to_abort_airspeed == 0 && auto_to_abort_accelaration == 0))

/*

*/
E[] manual_to_abort == 0 and Plane.Ok

/*
Mudar o 0 e o 1 do manual_to_abort
*/
A<> (manual_to_abort == 1 or (auto_to_abort_airspeed == 0 && auto_to_abort_accelaration == 0)) imply Plane.Abort

/*

*/
A<> Plane.TakeOff and (auto_to_abort_airspeed == 1 or auto_to_abort_airspeed == 0)

/*
A<> (manual_to_abort == 0 or (auto_to_abort_airspeed == 0 && auto_to_abort_accelaration == 0)) imply Plane.Abort
*/
A<> (manual_to_abort == 0 or (auto_to_abort_airspeed == 0 && auto_to_abort_accelaration == 1)) imply Plane.Abort

/*
Isto so acontece porque devi parar os sensores depois d echegar ao OK ou ao KO
*/
A<> (manual_to_abort == 0 or (auto_to_abort_airspeed == 1 && auto_to_abort_accelaration == 1)) imply Plane.Abort

/*

*/
A<> (manual_to_abort == 0 or (auto_to_abort_airspeed == 1 && auto_to_abort_accelaration == 0)) imply Plane.Abort

/*
R4 - A parte direita era desnecessaria. JA ESTA AQUI A<> (manual_to_abort == 1) imply Plane.Ok
*/
A<> (manual_to_abort == 0 or (auto_to_abort_airspeed == 0 && auto_to_abort_accelaration == 0)) imply Plane.Abort

/*
R4 - Explica um pouco a anterior
*/
A<> (manual_to_abort == 1 or (auto_to_abort_airspeed == 0 && auto_to_abort_accelaration == 0)) imply Plane.Ok

/*
R4 - Isto esta correcto porque apesar de o manual to abort estar ok, nao implica que ele esteja em OK, os outros valores podem falhar (auto_to_abort_accelaration and auto_to_abort_airspeed).

Nao \u00e9 visivel a primeira mas \u00e9 verdade por causa dos requsitios, provavelmente se o modelo estivesse mal, teriamos detectado.
*/
A<> (manual_to_abort == 1) imply Plane.Ok

/*
Requirement 4 - Se o manual to abort for igual a zero entao o aviao tem que fazer abort; Isto \u00e9 verifcado num estado A<>; Liveness;
*/
A<> (manual_to_abort == 0) imply Plane.Abort

/*

*/
E<> auto_to_abort_accelaration == 1

/*

*/
E<> auto_to_abort_accelaration == 0

/*
R2 - Exists a state whre auto_to_abort_airspeed is equal to 1, which means that airspeed can be wrong
*/
E<> auto_to_abort_airspeed == 0

/*
R2 - Exists a state whre auto_to_abort_airspeed is equal to 1, which means that airspeed can be ok
*/
E<> auto_to_abort_airspeed == 1

/*
R1  -- Comment --- Exits a final state where manual_to_abort == 1
*/
E<> manual_to_abort==1

/*
R1  -- Comment --- Exits a final state where manual_to_abort == 0
*/
E<> manual_to_abort==0

/*
The system does not enter in deadlock
*/
A[] not deadlock
