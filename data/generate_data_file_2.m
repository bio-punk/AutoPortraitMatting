% get the training data list

load trainlist.mat;

fid1 = fopen('portraitFCN_datalist.txt','w');
fid2 = fopen('portraitFCN+_datalist.txt','w');
dataroot = pwd;

for i = 1:length(dataroot)
   if dataroot(i) == '\'
       dataroot(i) = '/';
   end
end

numimg = 0;
for i=1:length(trainlist)
    
    if exist(['portraitFCN_data/' sprintf('%05d', trainlist(i)) '.mat'],'file')
        outstr = [dataroot '/portraitFCN_data/' sprintf('%05d',trainlist(i)) '.mat\t'  ...
            dataroot '/images_mask/' sprintf('%05d',trainlist(i)) '_mask.mat\n'];
        
        fprintf(fid1,outstr);
        
        outstr = [dataroot '/portraitFCN+_data/' sprintf('%05d',trainlist(i)) '.mat\t'  ...
            dataroot '/images_mask/' sprintf('%05d',trainlist(i)) '_mask.mat\n'];
        
        fprintf(fid2,outstr);
        numimg = numimg + 1;
    end
    
end

fclose(fid1);
fclose(fid2);

disp([num2str(numimg) ' training images are applied!']);

