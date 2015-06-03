syms x1 x2 real
% syms q11 q12 q13 q14 q15 q16 q17 q18 q19 real
% syms q21 q22 q23 q24 q25 q26 q27 q28 q29 real
% syms q31 q32 q33 q34 q35 q36 q37 q38 q39 real
% syms q41 q42 q43 q44 q45 q46 q47 q48 q49 real
% syms q51 q52 q53 q54 q55 q56 q57 q58 q59 real
% syms q61 q62 q63 q64 q65 q66 q67 q68 q69 real
% syms q71 q72 q73 q74 q75 q76 q77 q78 q79 real
% syms q81 q82 q83 q84 q85 q86 q87 q88 q89 real
% syms q91 q92 q93 q94 q95 q96 q97 q98 q99 real




% L=[q11 q12 q13 q14 q15 q16 q17 q18 q19
%  q21 q22 q23 q24 q25 q26 q27 q28 q29
%  q31 q32 q33 q34 q35 q36 q37 q38 q39
%  q41 q42 q43 q44 q45 q46 q47 q48 q49
%  q51 q52 q53 q54 q55 q56 q57 q58 q59
%  q61 q62 q63 q64 q65 q66 q67 q68 q69
%  q71 q72 q73 q74 q75 q76 q77 q78 q79
%  q81 q82 q83 q84 q85 q86 q87 q88 q89
%  q91 q92 q93 q94 q95 q96 q97 q98 q99];

d=[x1;
   x2;
   x1*x1;
   x1*x2;
   x2*x2;
   x1*x1*x1;
   x1*x1*x2;
   x1*x2*x2;
   x2*x2*x2];

d1=[x1*x1;
    x1*x2;
    x2*x2;
    x1*x1*x1;
    x1*x1*x2;
    x1*x2*x2;
    x2*x2*x2;
    x1*x1*x1*x1;
    x1*x1*x1*x2;
    x1*x1*x2*x2;
    x1*x2*x2*x2;
    x2*x2*x2*x2;
    x1*x1*x1*x1*x1;
    x1*x1*x1*x1*x2;
    x1*x1*x1*x2*x2;
    x1*x1*x2*x2*x2;
    x1*x2*x2*x2*x2;
    x2*x2*x2*x2*x2;
    x1*x1*x1*x1*x1*x1;
    x1*x1*x1*x1*x1*x2;
    x1*x1*x1*x1*x2*x2;
    x1*x1*x1*x2*x2*x2;
    x1*x1*x2*x2*x2*x2;
    x1*x2*x2*x2*x2*x2;
    x2*x2*x2*x2*x2*x2;];


sigma=[
    x1;
    x2;
    x1*x1;
    x1*x2;
    x2*x2;
    x1*x1*x1;
    x1*x1*x2;
    x1*x2*x2;
    x2*x2*x2];

L=randn(9,9);

l=[L(1,1);
   L(1,2)+L(2,1);
   L(2,2);
   L(1,3)+L(3,1);
   L(1,4)+L(4,1)+L(2,3)+L(3,2);
   L(1,5)+L(5,1)+L(2,4)+L(4,2);
   L(2,5)+L(5,2);
   L(1,6)+L(6,1)+L(3,3);
   L(1,7)+L(7,1)+L(2,6)+L(6,2)+L(3,4)+L(4,3);
   L(1,8)+L(8,1)+L(2,7)+L(7,2)+L(3,5)+L(5,3)+L(4,4);
   L(1,9)+L(9,1)+L(2,8)+L(8,2)+L(5,4)+L(4,5);
   L(2,9)+L(9,2)+L(5,5);
   L(3,6)+L(6,3);
   L(3,7)+L(7,3)+L(4,6)+L(6,4);
   L(3,8)+L(8,3)+L(4,7)+L(7,4)+L(5,6)+L(6,5);
   L(3,9)+L(9,3)+L(4,8)+L(8,4)+L(5,7)+L(7,5);
   L(4,9)+L(9,4)+L(5,8)+L(8,5);
   L(5,9)+L(9,5);
   L(6,6);
   L(6,7)+L(7,6);
   L(6,8)+L(8,6)+L(7,7);
   L(6,9)+L(9,6)+L(7,8)+L(8,7);
   L(7,9)+L(9,7)+L(8,8);
   L(9,8)+L(8,9);
   L(9,9)];

%p'*d1-d'*L*d

bphi=[x1*x1;
    x1*x2;
    x2*x2;
    x1*x1*x1;
    x1*x1*x2;
    x1*x2*x2;
    x2*x2*x2;
    x1*x1*x1*x1;
    x1*x1*x1*x2;
    x1*x1*x2*x2;
    x1*x2*x2*x2;
    x2*x2*x2*x2;]

phi=[
    x1;
    x2;
    x1*x1;
    x1*x2;
    x2*x2;
    ]

    
syms p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 real

%p=[p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12];


P=randn(5,5);

p=[P(1,1) P(2,1)+P(1,2) P(2,2) P(1,3)+P(3,1) P(1,4)+P(4,1)+P(2,3)+P(3,2) P(1,5)+P(5,1)+P(2,4)+P(4,2) P(2,5)+P(5,2) P(3,3) P(3,4)+P(4,3) P(3,5)+P(5,3)+P(4,4) P(4,5)+P(5,4) P(5,5)]';

phi'*P*phi-p'*bphi

% 
% V=p*phi
% 
% Vx1=diff(V,x1);
% Vx2=diff(V,x2);
% 
% collect(Vx1,[x1,x2])
% collect(Vx2,[x1,x2])
% 
% 
% W=[2*p(1) p(2) 3*p(4) 2*p(5) p(6) 4*p(8) 3*p(9) 2*p(10) p(11);
%    p(2)   2*p(3) p(5) 2*p(6) 3*p(7) p(9) 2*p(10) 3*p(11) 4*p(12)];
% 
% 
% F=[0 -1 -3/2 0 0 -1/2 0 0 0;
%    0  0    0 0 0    0 0 0 0];
% 
% G=[0;1];