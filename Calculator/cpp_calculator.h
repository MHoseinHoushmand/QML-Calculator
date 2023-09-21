#ifndef CPP_CALCULATOR_H
#define CPP_CALCULATOR_H

#include <QObject>
#include <QString>
class cpp_calculator : public QObject
{
  Q_OBJECT


public:
  explicit cpp_calculator(QObject *parent = nullptr);

signals:

public slots:
  QString calculate(QString input);
  QString calculate_rad(QString input);
  bool get_new_num();
  void set_new_num(bool a);
  QString get_output_result();
  void set_output_result(QString s);
  QString get_last_sign();
  void set_last_sign(QString char_input);
  void set_last_input(QString input);
  QString get_last_input();
  bool get_check_last_input();
  void set_check_last_input(bool input);



private:
  double output_result;
  double last_input;
  QString last_sign;
  bool new_num;
  bool check_last_input;


};


#endif // CPP_CALCULATOR_H
