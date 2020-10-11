#include "tinytest.h"
#include "user.h"
#include <conio.h>

void test() {
  user *u = new user(1, "test");

  ASSERT_STRING_EQUALS(u->toString(), "test");
}

int main(void) {
  RUN(test);

  TEST_REPORT();
  getch();
  return 0;
}