m=1;

for n=1:1000
    
    sync_1(n)=getdatasamples(sync,n);
    if sync_1(n)==1
        break;
    end
end
    

for t=1:1000
    
    sync_2(t)=getdatasamples(sync2,t);
    if sync_2(t)==1
        break;
    end
end
    

for m=1:1000
    
  pol_out1(m)= getdatasamples(pol1_out1,m);
  pol_out3(m)=getdatasamples(pol1_out3,m);
  pol_out5(m)=getdatasamples(pol1_out5,m);
  samples(m)= getdatasamples(fin1, m); 
  a(m)=m;    
end


for k=1:1000
    
    pol_interleave(2*k-1) = pol_out1(k);
    pol_interleave(2*k) = pol_out3(k);

end


shift = t-n

pol_out1_1 = pol_interleave(400:420)
pol_out3_1 = pol_out5(400+shift:430+shift)





