%Generator of file for div module

%Simple cases of multiplication
Input_1a = rand(1000,1);
Input_1b = rand(1000,1);

Output_1= Input_1a ./ Input_1b;

%Simple cases of division that has negative result
Input_2a = rand(1000,1);
Input_2b = -rand(1000,1);
Output_2= Input_2a ./ Input_2b;

%Edge_cases (Nan,add 0,infinity)
Input_3b = [inf;-inf;nan;0];
Input_3a = rand(4,1);
Output_3= Input_3a ./ Input_3b;

%concat the inputs and the output
Final_Input_a= [Input_1a;Input_2a;Input_3a];
Final_Input_b= [Input_1b;Input_2b;Input_3b];
Final_Output= [Output_1;Output_2;Output_3];

%open file descriptors and create the files
%then write the values to each one
fid = fopen('div_stim_a.txt', 'wt');
fid2 = fopen('div_stim_b.txt', 'wt');
fid3= fopen('div_output.txt', 'wt');

fprintf(fid, '%bx\n', Final_Input_a);
fprintf(fid2, '%bx\n', Final_Input_b);
fprintf(fid3, '%bx\n', Final_Output);

fclose(fid);
fclose(fid2);
fclose(fid3);
