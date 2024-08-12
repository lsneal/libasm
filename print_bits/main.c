//#include <unistd.h>
#include <stdio.h>
#include <inttypes.h>

uint16_t asm_func16();
uint32_t asm_func32();
uint64_t asm_func64();

void print_binary16(uint16_t number);
void print_binary32(uint32_t number);
void print_binary64(uint64_t number);


int main(void) {
    uint16_t res16 = asm_func16();
    uint32_t res32 = asm_func32();
    uint64_t res64 = asm_func64();

    printf("res16 = %u\n", res16);
    printf("res32 = %u\n", res32);
    printf("res64 = %u\n", res64);

    print_binary16(res16);
    print_binary32(res32);
    print_binary64(res64);

    return (10);
}


void print_binary64(uint64_t number) {
  char str[64];

  for(int i = 63; i >= 0; i--) {
    if(number & 1 > 0) str[i] = '1';
    else str[i] = '0';
    number = number >> 1;
  }

  printf("BIN: ");

  for(int i = 0; i < 64; i++) {
    printf("%c", str[i]);
    if(i % 8 == 7) printf(" ");
  }

  printf("\n");
}

void print_binary16(uint16_t number) {
  char str[16];

  for(int i = 15; i >= 0; i--) {
    if(number & 1 > 0) str[i] = '1';
    else str[i] = '0';
    number = number >> 1;
  }

  printf("BIN: ");

  for(int i = 0; i < 15; i++) {
    printf("%c", str[i]);
    if(i % 8 == 7) printf(" ");
  }

  printf("\n");
}

void print_binary32(uint32_t number) {
  char str[32];

  for(int i = 31; i >= 0; i--) {
    if(number & 1 > 0) str[i] = '1';
    else str[i] = '0';
    number = number >> 1;
  }

  printf("BIN: ");

  for(int i = 0; i < 31; i++) {
    printf("%c", str[i]);
    if(i % 8 == 7) printf(" ");
  }

  printf("\n");
}