%% Find 11 state [0; 0; 0; 1] with Grover algorithm
% X gate
X = [0, 1; 1, 0];
% Hadamard gate
H = 1/sqrt(2)*[1, 1; 1, -1];
% C-Not gate
CX = [1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 0, 1; 0, 0, 1, 0];
% CZ gate
CZ = [1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, -1];
I = eye(2);
% Amplitude amplification module from quantum circuit representation
% Two different interpretation (one has identity matrix) give the same result
Product_1 = kron(H,H)*kron(X,(X*H))*CX*kron(X,(H*X))*kron(H,H);
Product_2 = kron(H,H)*kron(X,X)*kron(I,H)*CX*kron(X,H)*kron(I,X)*kron(H,H);
% display(Product_1 == Product_2);
% display(isequal(Product_1, Product_2));

% 0 state
q_0 = [1; 0];
% 00 state
q_00 = kron(q_0,q_0);
q_00_t = transpose(q_00);
% Amplitude amplification module from math derivation
Product_3 = -kron(H,H)*(2*(q_00*q_00_t)-eye(4))*kron(H,H);
% display(Product_1 == Product_3);
% display((Product_1 - Product_3));
% Phase orcale 1 to mark 11 state
phase_1 = kron(H,H)*CZ;
% Measurement to locate 11 state with initial state as 00
output_1 = phase_1*Product_1*q_00;

%% Find 10 state [0; 0; 1; 0]
% Phase orcale 2 to mark 10 state
phase_2 = kron(H,H)*kron(X,I)*CZ*kron(X,I);
% Measurement to locate 10 state with initial state as 00
output_2 = phase_2*Product_1*q_00;