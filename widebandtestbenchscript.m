

y=fin1;
b=getdatasamplesize(sync_out);
a=[];
i=sqrt(-1);

for n=1:5012
    
    sync_out_1(n)= getdatasamples(sync_out,n);
    if sync_out_1(n)==1
        break;
    end
end
    
   

for m=1:5012
    
  fout1_re_array(m)= getdatasamples(fout1_re,m);
  fout1_im_array(m)=getdatasamples(fout1_im,m);
  fout1_comp(m)=fout1_re_array(m)+i*fout1_im_array(m);
  fout1_mag(m)=fout1_comp(m)*conj(fout1_comp(m));
  
 
  fout2_re_array(m)= getdatasamples(fout2_re,m);
  fout2_im_array(m)=getdatasamples(fout2_im,m);
  fout2_comp(m)=fout2_re_array(m)+i*fout2_im_array(m);
  fout2_mag(m)=fout2_comp(m)*conj(fout2_comp(m));
  
  
  samples(m)= getdatasamples(y, m); 

  
  fout_interleaved(2*m)=fout1_mag(m);
  fout_interleaved(2*m+1)=fout2_mag(m);
  
end


%fout2_mag(1:n)=[];
%fout1_mag(1:n)=[];
%fout_interleaved(1:2*n)=[];


x=fft(samples);


for m=1:5012
  a(m)=m;
end


subplot(2,3,1)
plot(a,x)
ylabel('fft of input')
subplot(2,3,2)
plot(fout1_mag)
ylabel('fftwidebandreal output1 magnitude')
subplot(2,3,3)
plot(fout1_comp)
ylabel('fftwidebandreal output1 complex')
subplot(2,3,4)
plot(fout2_mag)
ylabel('fftwidebandreal output2 magnitude')
subplot(2,3,5)
plot(fout_interleaved)
ylabel('fftwidebandreal interleaved')
subplot(2,3,6)
plot(fout1_re_array)
ylabel('fout1_re_array')