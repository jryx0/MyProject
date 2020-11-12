#include "user.h"
#include <conio.h>
#include <stdio.h>
#include <iostream>

void func()
{
  std::cout << std::endl
            << "in func" << std::endl;
  return;
}

int main(void)
{
  user *u;
  u = new user(1, "test");
  u->toString();
  
  std::cout << "press any key to exit ..." << std::endl;
  getch();
  delete u;
  return 0;
}