function [f]= convolve(f,ker)
[m,n,r]=size(f);        %size of image
    [x,y]=size(ker);        % kernel size
    pad_rgb=zeros(m+x-1,n+y-1,r);      
    pad_rgb((x+1)/2:m+((x-1)/2),(y+1)/2:n+((y-1)/2),:)=f(1:m,1:n,:);    %padding depending upon kernel size
    [m,n,r]=size(pad_rgb);
    f=zeros(m-x+1,n-y+1,r);
     for j=1:n-y+1          %convolving
         for i=1:m-x+1
            temp=pad_rgb(i:i+x-1,j:j+y-1,:);
            temp=temp(:,:,:).*ker;
            bb=sum(sum(temp));
            f(i,j,:)=abs(bb);
         end
     end

