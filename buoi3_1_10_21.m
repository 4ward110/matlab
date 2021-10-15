% help elmat 

diem = [6 7 2 9 10];

tin = [2 3 4 2 3];

tongdiem = 0;
tongtin = 0;
so_tin_no = 0;

for m= 1:length(diem)
    tongtin = tongtin + tin(m);
    tongdiem =  tongdiem + diem(m)*tin(m);
    if(diem(m) < 4)
        so_tin_no = so_tin_no + tin(m);
    end
end

dtb = tongdiem/tongtin
so_tin_no
        