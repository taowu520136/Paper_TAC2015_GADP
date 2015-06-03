clear all
syms x1 x2 x3 real
z =[ x1, x2, x3, x1^2, x1*x2, x2^2, x1*x3, x2*x3, x3^2, x1^3, x1^2*x2, ...
    x1*x2^2, x2^3, x1^2*x3, x1*x2*x3, x2^2*x3, x1*x3^2, x2*x3^2, x3^3]';
vars = [x1; x2; x3];
prog = sosprogram(vars);
VEC =  monomials([x1; x2; x3], 2:4);
[prog,V] = sospolyvar(prog, VEC, 'wscoeff');

V1 =diff(V,x1);
V2 =diff(V,x2);
V3  =diff(V,x3);
idx = [10,16,19,4,7,13,9,15,18,1,2,5,11,3,6,12,8,14,17];
    K =  [4*coeff_17 3*coeff_18  3*coeff_22  3*coeff_7  2*coeff_19 ...
          2*coeff_23 2*coeff_8   2*coeff_26  2*coeff_11 2*coeff_1 ...
          coeff_20  coeff_24     coeff_9     coeff_27   coeff_12 ...
          coeff_2  coeff_29      coeff_14    coeff_4;
          coeff_18  2*coeff_19   coeff_23    coeff_8   3*coeff_20 ...
          2*coeff_24 2*coeff_9   coeff_27    coeff_12  coeff_2 ... 
          4*coeff_21 3*coeff_25  3*coeff_10  2*coeff_28 2*coeff_13 ...
          2*coeff_3  coeff_30    coeff_15   coeff_5;
          coeff_22   coeff_23    2*coeff_26 coeff_11   coeff_24 ...
          2*coeff_27 coeff_12    3*coeff_29 2*coeff_14 coeff_4 ...      
          coeff_25   2*coeff_28  coeff_13   3*coeff_30 2*coeff_15 ...
          coeff_5    4*coeff_31  3*coeff_16 2*coeff_6];
      K(:,idx)*z -[V1;V2;V3]

