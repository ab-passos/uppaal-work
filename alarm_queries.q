//This file was generated from (Academic) UPPAAL 4.0.13 (rev. 4577), September 2010

/*
Exist a path where the sensor is always triggered
*/
E[] sensor.triggered

/*
Eventually the sensor will be triggerd and the ledlight equal to red
*/
E<> sensor.triggered and ledlight.Red

/*
interessante, no entanto se trocarmos a ordem na chamada dos canais j\u00e1 funciona
*/
 ledlight.Red --> sensor.triggered

/*
Pode nao acontecer porque para disparar a siren tem que estar 5 seg.
*/
 sensor.triggered --> ledlight.Siren

/*
Remove
*/
A<> sensor.triggered

/*
verdade em todos os estados de uma execucao possivel
*/
E[] sensor.Ok

/*
Reachability - Esta propriedade pode ser atingida;
*/
E<> ledlight.Siren

/*
igual ao de cima
*/
E<> sensor.triggered 

/*
The system do not deadlock
*/
A[] not deadlock\

