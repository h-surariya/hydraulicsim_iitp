import 'dart:math';

class piston_position_time_cal{
  List<double> piston_pos(double springconstant,double piston_mass,double viscosity,double pressure_diff){
    double t=0;
    print(springconstant);
    print(piston_mass);
    print(viscosity);
    print(pressure_diff);
    double c=pressure_diff,k=viscosity,m_p=piston_mass,b=springconstant;
    // double c=20,k=15,m_p=1.5,b=10;
    print("DOUBLEDOUBLEDOUBLEDOUBLEDOUBLEDOUBLEDOUBLEDOUBLEDOUBLEDOUBLEDOUBLEDOUBLEDOUBLEDOUBLEDOUBLEDOUBLEDOUBLEDOUBLEDOUBLEDOUBLEDOUBLEDOUBLE");
    List<double> ans=[];
    while(t<60){

      double eqnans=(c/b) + (c*exp(-(t*(k + pow((pow(k,2) - 4*b*m_p),(1/2))))/(2*m_p))*(k - pow((pow(k,2) - 4*b*m_p),(1/2))))/(2*b*pow((pow(k,2) - 4*b*m_p),(1/2))) - (c*exp(-(t*(k - pow((pow(k,2) - 4*b*m_p),(1/2))))/(2*m_p))*(k +pow((pow(k,2) - 4*b*m_p),(1/2))))/(2*b*pow((pow(k,2) - 4*b*m_p),(1/2)));
      ans.add(eqnans);
      t=t+0.01;

    }
    return ans;
}

List<double> velocity_grp(double springconstant,double piston_mass,double viscosity,double pressure_diff){
  double t=0;
  // double c=20,k=15,m_p=1.5,b=10;
  double c=pressure_diff,k=viscosity,m_p=piston_mass,b=springconstant;
  List<double> ans=[];
  while(t<60){
    double eqnans=(c*exp(-(t*(k - pow((pow(k,2) - 4*b*m_p),(1/2))))/(2*m_p))*(k + pow((pow(k,2) - 4*b*m_p),1/2))*(k - pow((pow(k,2) - 4*b*m_p),1/2)))/(4*b*m_p*pow((pow(k,2) - 4*b*m_p),1/2)) - (c*exp(-(t*(k + pow((pow(k,2) - 4*b*m_p),1/2)))/(2*m_p))*(k + pow((pow(k,2) - 4*b*m_p),1/2))*(k - pow((pow(k,2) - 4*b*m_p),1/2)))/(4*b*m_p*pow((pow(k,2) - 4*b*m_p),1/2));
    ans.add(eqnans);
    t=t+0.01;
  }
  return ans;

}
  List<double> piston_pos_single(double springconstant,double piston_mass,double viscosity,double pressure_diff){
    double t=0;
    print("SINGLESINGLESINGLESINGLESINGLESINGLESINGLESINGLESINGLESINGLESINGLESINGLESINGLESINGLESINGLESINGLESINGLESINGLESINGLESINGLESINGLESINGLESINGLE");
    print(springconstant);
    print(piston_mass);
    print(viscosity);
    print(pressure_diff);
    //double c=pressure_diff,k=viscosity,m_p=piston_mass,b=0;
    double c=20,k=15,m_p=1.5,b=10;
    List<double> ans=[];
    while(t<60){

      double eqnans=(c/b) + (c*exp(-(t*(k + pow((pow(k,2) - 4*b*m_p),(1/2))))/(2*m_p))*(k - pow((pow(k,2) - 4*b*m_p),(1/2))))/(2*b*pow((pow(k,2) - 4*b*m_p),(1/2))) - (c*exp(-(t*(k - pow((pow(k,2) - 4*b*m_p),(1/2))))/(2*m_p))*(k +pow((pow(k,2) - 4*b*m_p),(1/2))))/(2*b*pow((pow(k,2) - 4*b*m_p),(1/2)));
      ans.add(eqnans);
      t=t+0.01;

    }
    return ans;
  }
  List<double> velocity_grp_single(double springconstant,double piston_mass,double viscosity,double pressure_diff){
    double t=0;
     double c=20,k=15,m_p=1.5,b=10;
    //double c=pressure_diff,k=viscosity,m_p=piston_mass,b=0;
    List<double> ans=[];
    while(t<60){
      double eqnans=(c*exp(-(t*(k - pow((pow(k,2) - 4*b*m_p),(1/2))))/(2*m_p))*(k + pow((pow(k,2) - 4*b*m_p),1/2))*(k - pow((pow(k,2) - 4*b*m_p),1/2)))/(4*b*m_p*pow((pow(k,2) - 4*b*m_p),1/2)) - (c*exp(-(t*(k + pow((pow(k,2) - 4*b*m_p),1/2)))/(2*m_p))*(k + pow((pow(k,2) - 4*b*m_p),1/2))*(k - pow((pow(k,2) - 4*b*m_p),1/2)))/(4*b*m_p*pow((pow(k,2) - 4*b*m_p),1/2));
      ans.add(eqnans);
      t=t+0.01;
    }
    return ans;

  }

}