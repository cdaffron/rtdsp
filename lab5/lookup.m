while 5==5
    freq = input('Enter Frequency\n');
    index = floor((freq/24000)*8192);
    
%     value = abs(b(index)*G);
    value = abs(H(index));
    disp(value);
end