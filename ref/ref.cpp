#include <iostream>
#include <stdlib.h>
#include <time.h>

using namespace std;

bool B[90];
bool L[69];
bool C[9],Z1[200];
bool KEY[128];
bool IV[128];

bool AND2(bool x0, bool x1) {
    return x0 & x1;
}

bool AND3(bool x0, bool x1, bool x2) {
    return x0 & x1& x2;
}

bool AND4(bool x0, bool x1, bool x2, bool x3) {
    return x0 & x1& x2&x3;
}

bool AND5(bool x0, bool x1, bool x2, bool x3,bool x4) {
    return x0 & x1& x2& x3& x4;
}

bool h(bool x0, bool x1, bool x2, bool x3, bool x4, bool x5, bool x6, bool x7,bool x8) {
    bool a = AND5(x0, x1, x2, x7, x8) ^ AND4(x0, x1, x2, x7) ^ AND4(x0, x1, x2, x8) ^ AND3(x0, x1, x2) ^ AND5(x0, x1, x3, x7, x8)
             ^ AND4(x0, x1, x3, x7) ^ AND5(x0, x1, x4, x7, x8) ^ AND4(x0, x1, x4, x7) ^ AND4(x0, x1, x4, x8) ^ AND3(x0, x1, x4)
             ^ AND5(x0, x1, x5, x7, x8) ^ AND4(x0, x1, x5, x7) ^ AND5(x0, x1, x6, x7, x8) ^ AND4(x0, x1, x6, x8);

    bool b = AND4(x0, x1, x7, x8) ^ AND3(x0, x1, x8) ^ AND5(x0, x2, x3, x7, x8) ^ AND4(x0, x2, x3, x7) ^ AND4(x0, x2, x3, x8)
             ^ AND3(x0, x2, x3) ^ AND5(x0, x2, x4, x7, x8) ^ AND4(x0, x2, x4, x8) ^ AND5(x0, x2, x5, x7, x8) ^ AND4(x0, x2, x5, x7)
             ^ AND4(x0, x2, x5, x8) ^ AND3(x0, x2, x5) ^ AND5(x0, x2, x6, x7, x8) ^ AND4(x0, x2, x6, x8) ^ AND4(x0, x2, x7, x8);

    bool c = AND3(x0, x2, x8) ^ AND5(x0, x3, x4, x7, x8) ^ AND4(x0, x3, x4, x7) ^ AND5(x0, x3, x5, x7, x8) ^ AND4(x0, x3, x5, x7)
             ^ AND5(x0, x3, x6, x7, x8) ^ AND4(x0, x3, x6, x7) ^ AND3(x0, x3, x8) ^ AND2(x0, x3) ^ AND5(x0, x4, x5, x7, x8)
             ^ AND4(x0, x4, x5, x7) ^ AND5(x0, x4, x6, x7, x8) ^ AND4(x0, x4, x6, x8) ^ AND3(x0, x4, x7) ^ AND2(x0, x4);

    bool d = AND5(x0, x5, x6, x7, x8) ^ AND4(x0, x5, x6, x7) ^ AND4(x0, x5, x7, x8) ^ AND3(x0, x5, x7) ^ AND3(x0, x6, x7)
             ^ AND3(x0, x6, x8) ^ AND3(x0, x7, x8) ^ AND5(x1, x2, x3, x7, x8) ^ AND5(x1, x2, x4, x7, x8) ^ AND4(x1, x2, x4, x8)
             ^ AND5(x1, x2, x5, x7, x8) ^ AND5(x1, x2, x6, x7, x8) ^ AND4(x1, x2, x6, x8) ^ AND3(x1, x2, x7) ^ AND3(x1, x2, x8);

    bool e = AND2(x1, x2) ^ AND5(x1, x3, x4, x7, x8) ^ AND5(x1, x3, x5, x7, x8) ^ AND5(x1, x3, x6, x7, x8) ^ AND3(x1, x3, x7)
             ^ AND5(x1, x4, x5, x7, x8) ^ AND4(x1, x4, x5, x8) ^ AND5(x1, x4, x6, x7, x8) ^ AND3(x1, x4, x7) ^ AND2(x1, x4)
             ^ AND5(x1, x5, x6, x7, x8) ^ AND4(x1, x5, x6, x7) ^ AND4(x1, x5, x7, x8) ^ AND3(x1, x5, x7) ^ AND3(x1, x5, x8);

    bool f = AND3(x1, x6, x7) ^ AND2(x1, x8) ^ x1 ^ AND5(x2, x3, x4, x7, x8) ^ AND5(x2, x3, x5, x7, x8) ^ AND5(x2, x3, x6, x7, x8)
             ^ AND5(x2, x4, x5, x7, x8) ^ AND4(x2, x4, x5, x8) ^ AND5(x2, x4, x6, x7, x8) ^ AND4(x2, x4, x7, x8) ^ AND3(x2, x4, x8)
             ^ AND5(x2, x5, x6, x7, x8) ^ AND4(x2, x5, x6, x8) ^ AND3(x2, x5, x8) ^ AND4(x2, x6, x7, x8) ^ AND3(x2, x6, x8);

    bool g = AND3(x2, x7, x8) ^ x2 ^ AND5(x3, x4, x5, x7, x8) ^ AND4(x3, x4, x5, x7) ^ AND5(x3, x4, x6, x7, x8)
             ^ AND4(x3, x4, x6, x7) ^ AND5(x3, x5, x6, x7, x8) ^ AND4(x3, x5, x7, x8) ^ AND4(x3, x6, x7, x8) ^ AND3(x3, x6, x7)
             ^ AND2(x3, x7) ^ x3 ^ AND5(x4, x5, x6, x7, x8) ^ AND4(x4, x5, x6, x8) ^ AND4(x4, x6, x7, x8) ^ AND3(x4, x6, x8);

    bool i = AND2(x4, x7) ^ AND3(x5, x7, x8) ^ x5 ^ x6 ^ AND2(x7, x8) ^ x7 ^ x8 ^ 1;

    return a ^ b^ c^ d^ e^ f^ g^ i;
}

void initialization() {
    bool f = 0, g = 0, Z = 0;

    for (int i = 0; i < 511; i++) {
        for (int j = 0; j < 9; j++) {
            C[8-j] = (i >> j) & 0x1;
        }

        f = L[0] ^ L[5] ^ L[12] ^ L[22] ^ L[28] ^ L[37] ^ L[45] ^ L[58];

        g = B[0] ^ B[24] ^ B[49] ^ B[79] ^ B[84] ^ (B[3] & B[59]) ^ (B[10] & B[12]) ^ (B[15] & B[16])
            ^ (B[25] & B[53]) ^ (B[35] & B[42]) ^ (B[55] & B[58]) ^ (B[60] & B[74]) ^ (B[20] & B[22] & B[23])
            ^ (B[62] & B[68] & B[72]) ^ (B[77] & B[80] & B[81] & B[83]) ^ L[0] ^ KEY[i % 128];

        Z = B[1] ^ B[5] ^ B[11] ^ B[22] ^ B[36] ^ B[53] ^ B[72] ^ B[80] ^ B[84] ^ (L[5] & L[16])
            ^ (L[13] & L[15]) ^ (L[30] & L[42]) ^ (C[7] & L[22]) ^ h(L[7], L[33], L[38], L[50], L[59], C[2], B[85], B[41], B[9]);

        for (int j = 0; j < 59; j++) {
            L[j] = L[j + 1];
        }
        L[59] = f ^ Z;

        for (int j = 0; j < 89; j++) {
            B[j] = B[j + 1];
        }
        B[89] = g ^ Z;
    }
    int i=511;
    for (int j = 0; j < 9; j++) {
        C[8-j] = (i >> j) & 0x1;
    }

    for (int j = 0; j < 9; j++) {
        L[60 + j] = C[j];
    }
}

//keystream
void keystream() {
    bool f = 0, g = 0, Z = 0;
    int cnt = 0;
    for (int i = 0; i < 200; i++) {
        cnt = L[68] + 2 * L[67] + 4 * L[66] + 8 * L[65] + 16 * L[64] + 32 * L[63] + 64 * L[62];

        f = L[0] ^ L[5] ^ L[12] ^ L[22] ^ L[28] ^ L[37] ^ L[45] ^ L[58];

        g = B[0] ^ B[24] ^ B[49] ^ B[79] ^ B[84] ^ (B[3] & B[59]) ^ (B[10] & B[12]) ^ (B[15] & B[16])
            ^ (B[25] & B[53]) ^ (B[35] & B[42]) ^ (B[55] & B[58]) ^ (B[60] & B[74]) ^ (B[20] & B[22] & B[23])
            ^ (B[62] & B[68] & B[72]) ^ (B[77] & B[80] & B[81] & B[83]) ^ L[0] ^ KEY[cnt]^KEY[i%128];

        //L[67] rather than C[7], L[62] rather than C[2]. This is because C[2] and C[7] are static in this phase
        //It seems the original implementation does not match with the specification.
        Z = B[1] ^ B[5] ^ B[11] ^ B[22] ^ B[36] ^ B[53] ^ B[72] ^ B[80] ^ B[84] ^ (L[5] & L[16])
            ^ (L[13] & L[15]) ^ (L[30] & L[42]) ^ (L[67] & L[22]) ^ h(L[7], L[33], L[38], L[50], L[59], L[62], B[85], B[41], B[9]);

        for (int j = 0; j < 68; j++) {
            L[j] = L[j + 1];
        }
        L[68] = f ;

        for (int j = 0; j < 89; j++) {
            B[j] = B[j + 1];
        }
        B[89] = g  ;
        //cout << Z;
        Z1[i]=Z;
    }
}

int main() {
    srand(time(NULL));
    for (int i = 0; i < 128; i++) {
        KEY[i] =rand()%2;
        IV[i] =rand()%2;
    }


    for (int i = 0; i < 90; i++) {
        B[i] = IV[i];
    }
    for (int i = 0; i < 38; i++) {
        L[i] = IV[i+90];
    }

    for (int i = 38; i < 60; i++) {
        L[i] = 1;
    }

    initialization();
    keystream();

    for (int i = 0; i < 128; i+=4) {
        printf("%x",KEY[i]*8+KEY[i+1]*4+KEY[i+2]*2+KEY[i+3]);
        if(i%16==12) printf(" ");
    }
    cout<<"\n";
    for (int i = 0; i < 128; i+=4) {
        printf("%x",IV[i]*8+IV[i+1]*4+IV[i+2]*2+IV[i+3]);
        if(i%16==12) printf(" ");
    }
    cout<<"\n";

    for (int i = 0; i < 200; i+=4) {
        printf("%x",Z1[i]*8+Z1[i+1]*4+Z1[i+2]*2+Z1[i+3]);
        if(i%16==12) printf(" ");
    }
}
