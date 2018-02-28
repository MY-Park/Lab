function img2video(feat, numOfImg, uni)

images = cell(numOfImg,1);

for i=1:numOfImg
    filename = sprintf('./VOI_map_%s_%s_(%d).jpg',datestr(datetime,'yyyymmdd'),feat,uni(i));
    images{i} = imread(filename);
end

videoname = sprintf('VOI_map_%s_%s_video.avi',datestr(datetime,'yyyymmdd'),feat);
writerObj = VideoWriter(videoname);

secsPerImage = 8*ones(1,length(uni));

 % open the video writer
 open(writerObj);
 % write the frames to the video
 for u=1:length(images)
     % convert the image to a frame
     frame = im2frame(images{u});
     for v=1:secsPerImage(u) 
         writeVideo(writerObj, frame);
     end
 end
 % close the writer object
 close(writerObj);