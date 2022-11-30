function  [spec, SizeTD2, SizeTD1]= GetSpecFromBidary(fname, SizeTD2, SizeTD1, ByteOrder)

if (ByteOrder == 2)
    id=fopen(fname, 'r', 'l');			%use little endian format if asked for
else
    id=fopen(fname, 'r', 'b');			%use big endian format by default
end

a = zeros(SizeTD2*SizeTD1, 1);
% [a, count] = fread(id, SizeTD2*SizeTD1*4);
[a, count] = fread(id, SizeTD2*SizeTD1, 'int32');
% 
% disp(count);

for tel=1:SizeTD1
   spec(tel, 1:SizeTD2) = a( (tel-1)*SizeTD2 + (1 : SizeTD2) );
%    disp(spec(tel, 10));
end

fclose(id);