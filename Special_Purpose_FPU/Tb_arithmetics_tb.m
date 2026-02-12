%Generator of file for add module

%Simple cases of addition
Input_1a = rand(20,1);
Input_1b = rand(20,1);

Output_1= Input_1a + Input_1b;

%Simple cases of substraction
Input_2a = rand(20,1);
Input_2b = -rand(20,1);
Output_2= Input_2a + Input_2b;

%Edge_cases (Nan,add 0,infinity)
Input_3a = [inf;-inf;nan;0];
Input_3b = rand(4,1);
Output_3= Input_3a + Input_3b;

%concat the inputs and the output
Final_Input_a_add= [Input_1a;Input_2a;Input_3a];
Final_Input_b_add= [Input_1b;Input_2b;Input_3b];
Final_Output_add= [Output_1;Output_2;Output_3];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Generator of file for div module

%Simple cases of multiplication
Input_1a = rand(20,1);
Input_1b = rand(20,1);

Output_1= Input_1a ./ Input_1b;

%Simple cases of division that has negative result
Input_2a = rand(20,1);
Input_2b = -rand(20,1);
Output_2= Input_2a ./ Input_2b;

%Edge_cases (Nan,add 0,infinity)
Input_3b = [inf;-inf;nan;0];
Input_3a = rand(4,1);
Output_3= Input_3a ./ Input_3b;

%concat the inputs and the output
Final_Input_a_div= [Input_1a;Input_2a;Input_3a];
Final_Input_b_div= [Input_1b;Input_2b;Input_3b];
Final_Output_div= [Output_1;Output_2;Output_3];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Generator of file for mult module

%Simple cases of division
Input_1a = rand(20,1);
Input_1b = rand(20,1);

Output_1= Input_1a .* Input_1b;

%Simple cases ofmultiplication that has negative result
Input_2a = rand(20,1);
Input_2b = -rand(20,1);
Output_2= Input_2a .* Input_2b;

%Edge_cases (Nan,add 0,infinity)
Input_3a = rand(4,1);
Input_3b = [inf;-inf;nan;0];
Output_3= Input_3a .* Input_3b;

Final_Input_a_mult= [Input_1a;Input_2a;Input_3a];
Final_Input_b_mult= [Input_1b;Input_2b;Input_3b];
Final_Output_mult= [Output_1;Output_2;Output_3];

Final_Input_a=0;
Final_Input_b=0;
Final_Output=0;

for i=1:44
Final_Input_a = [Final_Input_a;Final_Input_a_add(i);Final_Input_a_div(i);Final_Input_a_mult(i)];
Final_Input_b = [Final_Input_b;Final_Input_b_add(i);Final_Input_b_div(i);Final_Input_b_mult(i)];
Final_Output = [Final_Output;Final_Output_add(i);Final_Output_div(i);Final_Output_mult(i)];
end

%open file descriptors and create the files
%then write the values to each one
fid = fopen('arithmetics_stim_a.txt', 'wt');
fid2 = fopen('arithmetics_stim_b.txt', 'wt');
fid3= fopen('arithmetics_output.txt', 'wt');

fprintf(fid, '%bx\n', Final_Input_a(2:133));
fprintf(fid2, '%bx\n', Final_Input_b(2:133));
fprintf(fid3, '%bx\n', Final_Output(2:133));

fclose(fid);
fclose(fid2);
fclose(fid3);
%clc;clear;