for i=1:91
   result(i) = tand(i-1);
end

i = uint16(1);
fid = fopen('calculate_1.txt', 'wt');
for i=1:91
fprintf(fid,"`INPUT_WIDTH'd%i  : data[62:0] <= 64'h%bx; \n",uint16(i-1) ,result(i));
end

fclose(fid);