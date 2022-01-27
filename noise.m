%% PCM 파일 로드
load handel.mat
[data,fs] = audioread('noise.wav');
%BlackboardScraping
%% SOUND 생성
dt = data(:,1);

%% SET PARAMETERS for STFT
    R = 10000;               % R: window length
    window = hamming(R);   % hamming window, length R
    N = 2^16;              % N: FFT resolution
    L = ceil(R*0.5);       % L: number of non-overlap samples
    overlap = R - L;       % Overlap = 50% of window length

[s, f, t] = spectrogram(dt,window,overlap,N,fs);

%s2 = s(745:1487,:); %500~1khz영역의 신호만 뽑아옴
s2 = s(100:1487,:); %더 넓은 범위의 신호 뽑아옴
%s2 = s(745:1700,:);

%[X,Y] = meshgrid(t,f(745:1487)); 
[X,Y] = meshgrid(t,f(100:1487));
%[X,Y] = meshgrid(t,f(745:1700));

Z = abs(s2);
figure(1)
Z = abs(s2);
mesh(X,Y,Z);    % Mesh 그래프 표시
figure(2);
contour(X,Y,Z)  % Contour 그래프 표시
load chirp.mat; %sound 출력
sound(data,fs); %sound 출력

