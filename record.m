recorder1 = audiorecorder(48000,16,1);
disp('Start');
recordblocking(recorder1,5);
disp('End');

filename1 = 'noise.wav';
y1 = getaudiodata(recorder1);
audiowrite(filename1,y1,48000);

[readY, Hz]=audioread(filename1);
plot(readY);