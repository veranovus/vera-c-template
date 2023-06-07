#include "vendor/std/std.h"

int main() {
  String s = std_string_from("hello, world!");

  printf("%s\n", s.ptr);

  return 0;
}