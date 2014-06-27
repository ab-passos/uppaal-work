//This file was generated from (Academic) UPPAAL 4.0.13 (rev. 4577), September 2010

/*
Exists a path where in all states the siren is off

*/
E[] siren.SirenOff

/*
sensor triggered leads to 
*/
sensor.Triggered --> alarm.Activated_Tripped or alarm.Activated_AlarmMode or alarm.Deactivating

/*

*/
sensor.Triggered --> alarm.Activated_Tripped

/*

*/
siren.SirenOn --> timeforsiren < 5

/*
Whenever sirenOn is satisfied and then eventually timeforsiren will be greater or equal to 5
*/
siren.SirenOn --> timeforsiren >= 5

/*
Exists a path where the siren is on
*/
E<> siren.SirenOn

/*

*/
A[] not deadlock
