#include <stdbool.h>
int I_0;
bool B_0;
int I_1;
bool B_1;
bool BNT_0(int x_0,int y_0,int x_1,int y_1){
	if (__VERIFIER_nondet_int()) {
		Start(x_0,y_0,x_1,y_1);
		int tempL_0 = I_0
		int tempL_1 = I_1
		Start(x_0,y_0,x_1,y_1);
		int tempR_0 = I_0
		int tempR_1 = I_1
		B_0 = tempL_0<=tempR_0;
		B_1 = tempL_1<=tempR_1;
		return -1;}
	if (__VERIFIER_nondet_int()) {
		Start(x_0,y_0,x_1,y_1);
		bool tempL_0 = B_0
		bool tempL_1 = B_1
		Start(x_0,y_0,x_1,y_1);
		bool tempR_0 = B_0
		bool tempR_1 = B_1
		B_0 = tempL_0&&tempR_0;
		B_1 = tempL_1&&tempR_1;
		return -1;}
	if (__VERIFIER_nondet_int()) {
		Start(x_0,y_0,x_1,y_1);
		bool tempL_0 = B_0
		bool tempL_1 = B_1
		B_0 = !tempL_0;
		B_1 = !tempL_1;
		return -1;}
}
int Start(int x_0,int y_0,int x_1,int y_1){
	if (__VERIFIER_nondet_int()) {
		I_0 = 0;
		I_1 = 0;
		return -1;}
	if (__VERIFIER_nondet_int()) {
		I_0 = 1;
		I_1 = 1;
		return -1;}
	if (__VERIFIER_nondet_int()) {
		I_0 = x_0;}
		I_1 = x_1;}
		return -1;}
	if (__VERIFIER_nondet_int()) {
		I_0 = y_0;}
		I_1 = y_1;}
		return -1;}
	if (__VERIFIER_nondet_int()) {
		Start(x_0,y_0,x_1,y_1);
		int tempL_0=I_0;
		int tempL_1=I_1;
		Start(x_0,y_0,x_1,y_1);
		int tempR_0=I_0;
		int tempR_1=I_1;
		I_0 = tempL_0+tempR_0;
		I_1 = tempL_1+tempR_1;
		return -1;}
	if (__VERIFIER_nondet_int()) {
		Start(x_0,y_0,x_1,y_1);
		int tempL_0=I_0;
		int tempL_1=I_1;
		Start(x_0,y_0,x_1,y_1);
		int tempR_0=I_0;
		int tempR_1=I_1;
		I_0 = tempL_0-tempR_0;
		I_1 = tempL_1-tempR_1;
		return -1;}
}
int main(){
	int x_0 = __VERIFIER_nondet_int();
	int y_0 = __VERIFIER_nondet_int();
	int x_1 = __VERIFIER_nondet_int();
	int y_1 = __VERIFIER_nondet_int();
	Start(x_0,y_0,x_1,y_1);
	int spec_out_0 = spec(x_0,y_0);
	int spec_out_1 = spec(x_1,y_1);
	__VERIFIER_assert(I_0!=spec_out_0||I_1!=spec_out_1);
}