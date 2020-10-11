#include "user.h"
#include <conio.h>
#include <stdio.h>

int main(void) {
  user *u;
  u = new user(1, "test");

  u->toString();

  getch();
  delete u;
  return 0;
}