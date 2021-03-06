% Plots field snapshots as a movie. Taken from appendices of
% Understanding FDTD, J. B Schneider.
% Input files are assumed to be in binary format.
basename = './FieldData/Ez';
y_min = -1;
y_max = 1;
simTime = 255;     % Number of frames to be read. Last saved field number 
                    % If last field saved is Ez1023.fdt, maximum simTime should be 1023.
size = [1024 1];    % Spatial size or width w.
frame = 1;
figure(1);
i = 0;
while i < simTime
    filename = sprintf ('%s%d.fdt', basename, frame);
    fid = fopen (filename, 'r', 'l');
    if fid == -1
        return;
    end
    data = fread (fid, size, 'double'); 
    plot (data)
    axis ([0 length(data) y_min y_max]);
    reel (frame) = getframe;
    frame = frame+1;
    i = i+1;
    fclose (fid);
end
%movie (reel, 1);
