#ifndef __USER_H__
#define __USER_H__
#include <string.h>
class object {
public:
  object() {}

  virtual ~object() {}

protected:
  int ID;
};

class user : object {
public:
  user(int id);
  user(int id, const char *name);
  ~user();

  char *toString(void);

protected:
  char *name;
};

#endif