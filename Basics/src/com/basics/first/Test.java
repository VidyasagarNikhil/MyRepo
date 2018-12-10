package com.basics.first;

class A {

	int a=10;
	static int b=20;
void m1() {		
		System.out.println("m1 method");		
	}
void m2() {		
		System.out.println("m1 method");		
	}
void m1(int a) {	
	System.out.println("m1 method with a:"+a);	
}
}

public class Test extends A{
	
	public static void main(String[] args) {
		System.out.println("Hello");	
		Test t=new Test();
	}
	
}
