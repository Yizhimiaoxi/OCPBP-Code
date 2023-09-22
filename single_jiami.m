



data=imread('LenaRGB.bmp');
%image layer
image=data(:,:,1);
%Show plain image:
subplot(2,2,1);imshow(image);title('Plain image');
image1=image;
%size of image
[m,k,s]=size(image1); 
%%
%Begin encryption by using image1
%Decompose the image into bitplanes
%Bit plane 000
for n=1
    for i=1:m
        for j=1:k
            a=bitget(image(i,j),n);             
            if(a==1)                            
                image1(i,j)=1;
            else
                image1(i,j)=0;
            end
        end
    end 
 end
%Bit plane 001
image2=image;
for n=2
    for i=1:m
        for j=1:k
            a=bitget(image(i,j),n);            
            if(a==1)                           
                image2(i,j)=1;
            else
                image2(i,j)=0;
            end
        end
    end
end
%Bit plane 010
image3=image;
for n=3
    for i=1:m
        for j=1:k
            a=bitget(image(i,j),n);             
            if(a==1)                            
                image3(i,j)=1;
            else
                image3(i,j)=0;
            end
        end
    end
end
%Bit plane 011
image4=image;
for n=4
    for i=1:m
        for j=1:k
            a=bitget(image(i,j),n);             
            if(a==1)                           
                image4(i,j)=1;
            else
                image4(i,j)=0;
            end
        end
    end 
 end
%Bit plane 100
image5=image;
for n=5
    for i=1:m
        for j=1:k
            a=bitget(image(i,j),n);            
            if(a==1)                           
                image5(i,j)=1;
            else
                image5(i,j)=0;
            end
        end 
    end 
end
%Bit plane 101
image6=image;
for n=6
    for i=1:m
        for j=1:k
            a=bitget(image(i,j),n);             
            if(a==1)                           
                image6(i,j)=1;
            else
                image6(i,j)=0;
           end
        end
    end 
 end
%Bit plane 110
  image7=image;
for n=7
    for i=1:m
        for j=1:k
            a=bitget(image(i,j),n);            
            if(a==1)                            
                image7(i,j)=1;
            else
                image7(i,j)=0;
            end
        end 
    end     
end
%Bit plane 111
image8=image;
for n=8
    for i=1:m
        for j=1:k
            a=bitget(image(i,j),n);            
            if(a==1)                           
                image8(i,j)=1;
            else
                image8(i,j)=0;
            end
        end
    end    
end
  %%
  %First step encryption
   for i=1:1:m
       for j=2:2:k
           imag6(i,j)=image1(i,j);
           imag2(i,j)=image2(i,j);
           imag8(i,j)=image3(i,j);
           imag4(i,j)=image4(i,j);
           imag3(i,j)=image5(i,j);
           imag7(i,j)=image6(i,j);
           imag1(i,j)=image7(i,j);
           imag5(i,j)=image8(i,j);
       end
   end
   for i=1:1:m
       for j=1:2:k
           imag7(i,j)=image1(i,j);
           imag5(i,j)=image2(i,j);
           imag8(i,j)=image3(i,j);
           imag6(i,j)=image4(i,j);
           imag2(i,j)=image5(i,j);
           imag4(i,j)=image6(i,j);
           imag1(i,j)=image7(i,j);
           imag3(i,j)=image8(i,j);
       end
   end
   %%
   %Second step encryption
   for i=1:1:m
       for j=k:1
           if j>=2
               imag1(i,j)=bitxor(imag8(i,j-1),imag1(i,j));
           end
           imag2(i,j)=bitxor(imag1(i,j),imag2(i,j));
           imag3(i,j)=bitxor(imag2(i,j),imag3(i,j));
           imag4(i,j)=bitxor(imag3(i,j),imag4(i,j));
           imag5(i,j)=bitxor(imag4(i,j),imag5(i,j));
           imag6(i,j)=bitxor(imag5(i,j),imag6(i,j));
           imag7(i,j)=bitxor(imag6(i,j),imag7(i,j));
           imag8(i,j)=bitxor(imag7(i,j),imag8(i,j));
       end
   end
  %%
  %Perform bitplane accumulation
    n=1;
    for i=1:m
        for j=1:k
            imag(i,j)=imag1(i,j);     
        end
    end
      n=2;
    for i=1:m
        for j=1:k
            imag(i,j)=imag(i,j)+imag2(i,j)*2^(n-1);    
        end
    end
     n=3;
    for i=1:m
        for j=1:k
            imag(i,j)=imag(i,j)+imag3(i,j)*2^(n-1);    
        end
    end
     n=4;
    for i=1:m
        for j=1:k
            imag(i,j)=imag(i,j)+imag4(i,j)*2^(n-1);    
        end
    end
     n=5;
    for i=1:m
        for j=1:k
            imag(i,j)=imag(i,j)+imag5(i,j)*2^(n-1);   
        end
    end
     n=6;
    for i=1:m
        for j=1:k
            imag(i,j)=imag(i,j)+imag6(i,j)*2^(n-1);     
        end
    end
     n=7;
    for i=1:m
        for j=1:k
            imag(i,j)=imag(i,j)+imag7(i,j)*2^(n-1);     
        end
    end
     n=8;
    for i=1:m
        for j=1:k
            imag(i,j)=imag(i,j)+imag8(i,j)*2^(n-1);     
        end
    end
A=imag;
%%
%Third step encryption(key image)
[M,N]=size(A);
u1=4;u2=4;x1(1)=0.1;x2(1)=0.9;
sumA=sum(sum(A));
k=mod(sumA,256)*1.0/256;
x1(1)=(x1(1)+k)/2;
x2(1)=(x2(1)+k)/2;
y1(1)=(1/3.1415926535)*asin(sqrt(x1(1)));
y2(1)=(1/3.1415926535)*asin(sqrt(x2(1)));
%Generate 2 logistic chaotic sequences
for i=1:1:M*N-1 
  x1(i+1)=u1*x1(i)*(1-x1(i));
  x2(i+1)=u2*x2(i)*(1-x2(i));
end
%Transforming 2 Logistic sequences to obtain two y sequences
for i=1:1:M*N  
  y1(i)=(1/3.1415926535)*asin(sqrt(x1(i)));
  y2(i)=(1/3.1415926535)*asin(sqrt(x2(i)));
end
x11=zeros(M,N);
x22=zeros(M,N);
n=1;
k=zeros(M,N);
for i=1:1:M  
    for j=1:1:N
      if mod(n,2)==0
         k(n)=mod(floor(y1(n)*1015),256);
      else
         k(n)=mod(floor(y2(n)*1015),256);
      end
     n=n+1;
    end
end
x11=k;
x22=k;
%%
%Output key image
  A=uint8(A);
  c=zeros(M,N);
  c=uint8(k);
  subplot(2,2,2);imshow(c);title('Key image');
 %%
 %Fourth step encryption
 A1=zeros(M,N);
 [B1,I]=sort(x11,2);
 for i=1:1:M
    for j=1:N
        A1(i,j)=A(i,I(i,j));
    end
 end
 A2=zeros(M,N);
 [B2,I1]=sort(x22,1);
 for j=1:1:N
     for i=1:1:M
        A2(i,j)=A1(I1(i,j),j);
     end
 end
 A1=A2;
 n=1;
 for i=1:1:M
    for j=1:1:N
     A2(i,j)=bitxor(A1(i,j),k(n));  
     n=n+1;
    end
 end
 jiami=uint8(A2);
%%
%Attack Test Code Section
%Cutting attack:
%jiami=uint8(A2);
%for i=17:494
%    for j=17:494
%       jiami(i,j)=255;
%    end
%end

%Noise attack:
%A2=uint8(A2);
%A2=imnoise(A2,'salt & pepper', 0.25);
%jiami=A2;

%%
%%Output encrypted images
subplot(2,2,3);imshow(jiami);title('Encryption image');

%%
%Start decryption
%Fourth step dencryption
A2=jiami;
n=1;
for i=1:1:M
    for j=1:1:N
     A1(i,j)=bitxor(A2(i,j),k(n));   
     n=n+1;
    end
end
 
 %%
 %Third step dencryption
 A2=zeros(M,N);
 for j=1:1:N
    for i=1:1:M
        A2(I1(i,j),j)=A1(i,j);
    end
end
 A1=zeros(M,N);
 for i=1:1:M
    for j=1:N
       A1(i,I(i,j))=A2(i,j);
    end
 end
A2=A1;
%%
%Second step dencryption
image=A2;
image1=image;
[m,k,s]=size(image1);                       

%Decomposing Bitplane
image1=image;
for n=1
    for i=1:m
        for j=1:k
            a=bitget(image(i,j),n);             
            if(a==1)                            
                image1(i,j)=1;
            else
                image1(i,j)=0;
            end
        end
    end 
end
 image2=image;
for n=2
    for i=1:m
        for j=1:k
            a=bitget(image(i,j),n);            
            if(a==1)                           
                image2(i,j)=1;
            else
                image2(i,j)=0;
          end
        end
    end 
end
image3=image;
for n=3
    for i=1:m
        for j=1:k
            a=bitget(image(i,j),n);             
            if(a==1)                            
                image3(i,j)=1;
            else
                image3(i,j)=0;
            end
        end
    end 
end
 image4=image;
for n=4
    for i=1:m
        for j=1:k
            a=bitget(image(i,j),n);             
            if(a==1)                           
                image4(i,j)=1;
            else
                image4(i,j)=0;
            end
        end
    end 
end
image5=image;
for n=5
    for i=1:m
        for j=1:k
            a=bitget(image(i,j),n);            
            if(a==1)                           
                image5(i,j)=1;
            else
                image5(i,j)=0;
           end
        end
    end 
 end
image6=image;
for n=6
    for i=1:m
        for j=1:k
            a=bitget(image(i,j),n);             
            if(a==1)                           
                image6(i,j)=1;
            else
                image6(i,j)=0;
          end
        end
    end 
 end
image7=image;
for n=7
    for i=1:m
        for j=1:k
            a=bitget(image(i,j),n);            
            if(a==1)                            
                image7(i,j)=1;
            else
                image7(i,j)=0;
            end
        end
    end 
 end
image8=image;
for n=8
    for i=1:m
        for j=1:k
            a=bitget(image(i,j),n);            
            if(a==1)                           
                image8(i,j)=1;
            else
                image8(i,j)=0;
            end
        end
    end 
 end
%%
%First step dencryption
[m,k]=size(A);
 for i=1:m
       for j=k:1
            image8(i,j)=bitxor(image7(i,j),image8(i,j));
            image7(i,j)=bitxor(image6(i,j),image7(i,j));
            image6(i,j)=bitxor(image5(i,j),image6(i,j));
            image5(i,j)=bitxor(image4(i,j),image5(i,j));  
            image4(i,j)=bitxor(image3(i,j),image4(i,j));
            image3(i,j)=bitxor(image2(i,j),image3(i,j));
            image2(i,j)=bitxor(image1(i,j),image2(i,j));  
            if j<=k-1
               image1(i,j)=bitxor(image1(i,j),image8(i,j+1));
           end
       end
 end
for i=1:1:m
    for j=2:2:k
          imagee7(i,j)=image1(i,j);
          imagee2(i,j)=image2(i,j);
          imagee5(i,j)=image3(i,j);
          imagee4(i,j)=image4(i,j);
          imagee8(i,j)=image5(i,j);
          imagee1(i,j)=image6(i,j);
          imagee6(i,j)=image7(i,j);
          imagee3(i,j)=image8(i,j);
    end
end
 for i=1:1:m
       for j=1:2:k
            imagee7(i,j)=image1(i,j);
            imagee5(i,j)=image2(i,j);
            imagee8(i,j)=image3(i,j);
            imagee6(i,j)=image4(i,j);
            imagee2(i,j)=image5(i,j);
            imagee4(i,j)=image6(i,j);
            imagee1(i,j)=image7(i,j);
            imagee3(i,j)=image8(i,j);
       end
 end 
   imag1=imagee1;
   imag2=imagee2;
   imag3=imagee3;
   imag4=imagee4;
   imag5=imagee5;
   imag6=imagee6;
   imag7=imagee7;
   imag8=imagee8;
  %%
  %Perform bitplane accumulation
    n=1;
    for i=1:m
        for j=1:k
            imag(i,j)=imag1(i,j);     
        end
    end
      n=2;
    for i=1:m
        for j=1:k
            imag(i,j)=imag(i,j)+imag2(i,j)*2^(n-1);    
        end
    end
     n=3;
    for i=1:m
        for j=1:k
            imag(i,j)=imag(i,j)+imag3(i,j)*2^(n-1);    
        end
    end
     n=4;
    for i=1:m
        for j=1:k
            imag(i,j)=imag(i,j)+imag4(i,j)*2^(n-1);    
        end
    end
     n=5;
    for i=1:m
        for j=1:k
            imag(i,j)=imag(i,j)+imag5(i,j)*2^(n-1);   
        end
    end
     n=6;
    for i=1:m
        for j=1:k
            imag(i,j)=imag(i,j)+imag6(i,j)*2^(n-1);     
        end
    end
     n=7;
    for i=1:m
        for j=1:k
            imag(i,j)=imag(i,j)+imag7(i,j)*2^(n-1);     
        end
    end
     n=8;
    for i=1:m
        for j=1:k
            imag(i,j)=imag(i,j)+imag8(i,j)*2^(n-1);     
        end
    end
    jiemi=imag;
%%
%%Output Decrypted Image
subplot(2,2,4);imshow(jiemi),title('Decrypt image')
