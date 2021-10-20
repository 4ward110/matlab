% II.5

n=[-20:1:20];

x=zeros(1,length(n));

N=5;

x(n>=0&n<=(N-1))=1;

stem(n,x)

axis([-11 11 -0.1 1.1])

xlabel('n')

ylabel('x(n)')

grid on

figure

h=zeros(1,length(n));

n1=[0:1:4];

t=n>=0&n<=4;

h=1-(n1./4);

stem(n1,h)

xlabel('n')

ylabel('h(n)')

axis([-11 11 -1.1 1.1])

grid on

y=conv(x,h,'same');
figure
stem(n,y)
grid on

x_trans = fft(x);
x_tran = x_trans(1:5);
h_trans = fft(h);

multi = x_tran.*h_trans;
figure
stem(n, multi)
grid on
