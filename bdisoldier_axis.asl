//EJEMPLO LUCHADOR 

+flag(F): team(200)
  <-
  .create_control_points(F,100,3,C);
  +control_points(C);
  //.wait(5000);
  .length(C,L);
  +total_control_points(L);
  +patrolling;
  +patroll_point(0);
  .print("Got control points:", C).


+target_reached(T): patrolling & team(200)
  <-
  ?patroll_point(P);
  -+patroll_point(P+1);
  -target_reached(T).

+patroll_point(P): total_control_points(T) & P<T
  <-
  ?control_points(C);
  .nth(P,C,A);
  .goto(A).
 // .print("Voy a Pos: ", A).

+patroll_point(P): total_control_points(T) & P==T
  <-
  -patroll_point(P);
  +patroll_point(0).
 
+enemies_in_fov(ID,Type,Angle,Distance,Health,Position) : 
  not friends_in_fov(ID_F,Type_F,Angle,Distance_F,Health_F,Position_F) 
  <-
  .shoot(3,Position).