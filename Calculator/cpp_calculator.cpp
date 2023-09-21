#include "cpp_calculator.h"
#include "QString"
#include "cmath"
cpp_calculator::cpp_calculator(QObject *parent) : QObject(parent)
{
  output_result=0;
  last_sign="+";
  new_num=true;
  last_input=0.000000001;
  check_last_input=true;

}



QString cpp_calculator::calculate(QString input)
{
  if(last_sign=="+")
      output_result+=input.toDouble();
  else if(last_sign=="-")
      output_result-=input.toDouble();
  else if(last_sign=="/")
      if(input.toDouble()<0.00000000001&&input.toDouble()>-0.00000000001)
        return "Error!";
      else
        output_result/=input.toDouble();
  else if(last_sign=="*")
    output_result*=input.toDouble();
  return QString::number(output_result);

}

QString cpp_calculator::calculate_rad(QString input)
{
  output_result=sqrt(input.toDouble());

  return QString::number(output_result);

}



bool cpp_calculator::get_new_num()
{
  return new_num;
}

void cpp_calculator::set_new_num(bool a)
{
  new_num=a;
}

QString cpp_calculator::get_output_result()
{
  return QString::number(output_result);
}

void cpp_calculator::set_output_result(QString s)
{
  output_result=s.toDouble();
}

QString cpp_calculator::get_last_sign()
{
  return last_sign;
}

void cpp_calculator::set_last_sign(QString char_input)
{
  last_sign=char_input;
}

void cpp_calculator::set_last_input(QString input)
{
  last_input=input.toDouble();
}

QString cpp_calculator::get_last_input()
{
  return QString::number(last_input);
}

bool cpp_calculator::get_check_last_input()
{
  return check_last_input;
}

void cpp_calculator::set_check_last_input(bool input)
{
  check_last_input=input;
}










