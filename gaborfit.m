function gab=gaborfit()
% produce a set of gabor wavelet directly
    gab=zeros(128,128,5456);
    count=1;
    m=1;
    for i=1:5
        FOV=2^(i-1);
        lambda=128/FOV;
        if FOV==2
            x0=-32;
            y0=x0;
        elseif FOV==4
            x0=-48;
            y0=x0;
        elseif FOV==8
            x0=-56;
            y0=-56;
        elseif FOV==1
            x0=0;
            y0=0;
        else
            x0=-60;
            y0=-60;
        end
        for angle=0:22.5:7*22.5
            for j=0:FOV-1
                for k=0:FOV-1
                    gab(:,:,count)=gabor_fn(angle,lambda,0,1,x0+j*lambda,y0+k*lambda);
                    count=count+1
                    gab(:,:,count)=gabor_fn(angle,lambda,180,1,x0+j*lambda,y0+k*lambda);
                    count=count+1
                    m=m+1;
                end
            end
        end
    end
end