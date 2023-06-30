#include <stdio.h>
#include <whisper.h>

int main(int argc, char *argv[]) {
  fprintf(stdout, "%s\n", whisper_print_system_info());
}
