Input_a_add_deg = uint16([0 5 0 0 5 4 0 5 5]);
Input_b_add_deg = uint16([50 50 45 50 50 45 50 50 45]);

test_case_add = sind(0) + sind(50);
test_case_add = [test_case_add;sind(5) + cosd(50)];
test_case_add = [test_case_add;tand(0) + cotd(45)]; 

test_case_mult = sind(0) * sind(50);
test_case_mult = [test_case_mult;sind(5) * cosd(50)];
test_case_mult = [test_case_mult;tand(4) * cotd(45)]; 

test_case_div = sind(0) / cosd(50);
test_case_div = [test_case_div;sind(5) / sind(50)];
test_case_div = [test_case_div;tand(5) / cotd(45)];

Output_final = [test_case_add;test_case_mult;test_case_div];

fid = fopen('top_output.txt', 'wt');
fprintf(fid, '%bx\n', Output_final);
fclose(fid);

fid = fopen('top_input_a.txt', 'wt');
fprintf(fid, '%x\n', Input_a_add_deg);
fclose(fid);

fid = fopen('top_input_b.txt', 'wt');
fprintf(fid, '%x\n', Input_b_add_deg);
fclose(fid);