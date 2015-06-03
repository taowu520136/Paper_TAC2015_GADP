%clear all
F=[0 -1 -3/2 0 0 -1/2 0 0 0;   
   0  0    0 0 0    0 0 0 0];
epsilon=diag([1,1,0,0,0,0,0,0,0]);
R=.1;
K0=[1 -2]; 
K=[K0 0  0     0     0    0      0             0];
G=[0;0.6];

cvx_begin sdp
cvx_precision best
variable P(5,5) symmetric
variable L(9,9) symmetric

p=[P(1,1) P(2,1)+P(1,2) P(2,2) P(1,3)+P(3,1) P(1,4)+P(4,1)+P(2,3)+P(3,2) P(1,5)+P(5,1)+P(2,4)+P(4,2) P(2,5)+P(5,2) P(3,3) P(3,4)+P(4,3) P(3,5)+P(5,3)+P(4,4) P(4,5)+P(5,4) P(5,5)]';
W=[2*p(1) p(2) 3*p(4) 2*p(5) p(6) 4*p(8) 3*p(9) 2*p(10) p(11);
    p(2)   2*p(3) p(5) 2*p(6) 3*p(7) p(9) 2*p(10) 3*p(11) 4*p(12)];
P>=diag([1,1,0,0,0]);

H = ( 1/2*W'*(F+G*K))+epsilon;%+K'*R*K;
L(1,1)==H(1,1);
L(1,2)+L(2,1)==H(1,2)+H(2,1);
L(2,2)==H(2,2);
L(1,3)+L(3,1)==H(1,3)+H(3,1);
L(1,4)+L(4,1)+L(2,3)+L(3,2)==H(1,4)+H(4,1)+H(2,3)+H(3,2);
L(1,5)+L(5,1)+L(2,4)+L(4,2)==H(1,5)+H(5,1)+H(2,4)+H(4,2);
L(2,5)+L(5,2)==H(2,5)+H(5,2);
L(1,6)+L(6,1)+L(3,3)== H(1,6)+H(6,1)+H(3,3);
L(1,7)+L(7,1)+L(2,6)+L(6,2)+L(3,4)+L(4,3)==H(1,7)+H(7,1)+H(2,6)+H(6,2)+H(3,4)+H(4,3);
L(1,8)+L(8,1)+L(2,7)+L(7,2)+L(3,5)+L(5,3)+L(4,4)==H(1,8)+H(8,1)+H(2,7)+H(7,2)+H(3,5)+H(5,3)+H(4,4);
L(1,9)+L(9,1)+L(2,8)+L(8,2)+L(5,4)+L(4,5)==H(1,9)+H(9,1)+H(2,8)+H(8,2)+H(5,4)+H(4,5);
L(2,9)+L(9,2)+L(5,5)==H(2,9)+H(9,2)+H(5,5);
L(3,6)+L(6,3)==H(3,6)+H(6,3);
L(3,7)+L(7,3)+L(4,6)+L(6,4)==H(3,7)+H(7,3)+H(4,6)+H(6,4);
L(3,8)+L(8,3)+L(4,7)+L(7,4)+L(5,6)+L(6,5)==H(3,8)+H(8,3)+H(4,7)+H(7,4)+H(5,6)+H(6,5);
L(3,9)+L(9,3)+L(4,8)+L(8,4)+L(5,7)+L(7,5)==H(3,9)+H(9,3)+H(4,8)+H(8,4)+H(5,7)+H(7,5);
L(4,9)+L(9,4)+L(5,8)+L(8,5)==H(4,9)+H(9,4)+H(5,8)+H(8,5);
L(5,9)+L(9,5)==H(5,9)+H(9,5);
L(6,6)==H(6,6);
L(6,7)+L(7,6)==H(6,7)+H(7,6);
L(6,8)+L(8,6)+L(7,7)==H(6,8)+H(8,6)+H(7,7);
L(6,9)+L(9,6)+L(7,8)+L(8,7)==H(6,9)+H(9,6)+H(7,8)+H(8,7);
L(7,9)+L(9,7)+L(8,8)==H(7,9)+H(9,7)+H(8,8);
L(9,8)+L(8,9)==H(9,8)+H(8,9);
L(9,9)==H(9,9);
L<=0;
cvx_end

P0=P;
