% Create a random digital message
M = 4; % Alphabet size
x = randint(5000,1,M); % Message generator
% Use QPSK modulation to produce y.
h = modem.pskmod(M,pi/4); %Thiet lap thuoc tinh dieu che dung QPSK
h.symbolorder = 'gray'; %Thiet lap thuoc tinh dieu che dung ma gray
y = modulate(h,x); %thuc hien dieu che
scatterplot(y,1,0,'o'); %ve bieu do chom sao
% Transmit signal through an AWGN channel.
ynoisy = awgn(y,15,'measured');
% Create scatter plot from noisy data.
h = scatterplot(ynoisy,1,0,'xb');
hold on;
scatterplot(y,1,0,'or',h);
% Demodulate ynoisy to recover the message.
h = modem.pskdemod(M,pi/4);
h.symbolorder = 'gray';
z=demodulate(h,ynoisy);