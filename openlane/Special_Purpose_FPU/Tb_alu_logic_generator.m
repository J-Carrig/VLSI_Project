%Generator of file for add module

input_a = [4; 4; 4; 4];
input_b = [2; 2; 2; 2];
Final_output = [6; 2; 8; NaN];

%open file descriptors and create the files
%then write the values to each one
fid = fopen('alu_logic_stim_a.txt', 'wt');
fid2 = fopen('alu_logic_stim_b.txt', 'wt');
fid3= fopen('alu_logic_output.txt', 'wt');

fprintf(fid, '%bx\n', input_a);
fprintf(fid2, '%bx\n', input_b);
fprintf(fid3, '%bx\n', Final_output);

fclose(fid);
fclose(fid2);
fclose(fid3);
%clc;clear;