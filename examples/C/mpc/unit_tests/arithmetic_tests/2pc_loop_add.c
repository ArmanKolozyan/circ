int main(__attribute__((private(0))) int a, __attribute__((private(1))) int b) { 
   int c = a * b;
   // c = a + b;
   // for (int i = 0; i < 10000; i++) {
   //    c = c * a;
   // }
   return c;
}

// 0.16922426223754883
// 0.1644151210784912
// 0.1597151756286621

// 0.2042381763458252
// 0.20387625694274902
// 0.23464512825012207

// 0.14112472534179688
// 0.16500568389892578
// 0.13888955116271973