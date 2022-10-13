%%%% M. McCrea
%%%% figures for "A model for the collective synchronization 
%%%% of flashing in Photinus carolinus" 


%%% uses izdll XPP codes 

%%% uses data files: 'test.dat', 's0(1).dat', 's0(2).dat', 'fig2.dat',
%%% 'fig2b.dat', 'fig2c.dat', 'fig2d.dat', 'ibi1.dat', 'ibi100.dat', 
%%% 'fig1.dat', 'latest_test.dat', 'latest_wave.dat'

%%% NOTE. Running at once may take awhile, try loading data and copying
%%% individual figure codes into the command section




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% figure 1 by Professor Ermentrout 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% figure 2 by Professor Ermentrout 


%%%%%%%%%%%%%%%%%%% figure 3 - Spatial connectivity of the model fireflies

m1=load('test.dat','-ascii'); %loading data 

a1=[];b1=[];

for n = 302:401 % firefly x positions 
    a = [m1(1,n)];
    a1 = [a1,a];
end

x=a1';

for n = 402:501 % firefly y positons
    b = [m1(1,n)];
    b1 =[b1,b];
end

y=b1';


figure(1);

% figure 3a - connectivity for 0.1 coupling radius 

subplot(2,2,1)
scatter(a1,b1); % plot x,y positions 
xlim([0 1]);
ylim([0 1]);
points = [x y];
xlabel('x position', 'FontSize', 14);
ylabel('y position', 'FontSize', 14);
text(0.89,0.1,'(A)', 'FontSize', 14)
box on
hold on


adjacency_matrix = [];
distances_matrix = [];

for n = [1:100]
             
distances = sqrt((x-x(n,:)).^2 + (y-y(n,:)).^2);
distances1 = distances < 0.1; % finds connectivity for 0.1
distances_matrix = [distances_matrix, distances];
adjacency_matrix = [adjacency_matrix, distances1];


end

adjacency_matrix;
distances_matrix;

count=0; 
for i = 1:100 
    for j = 1:100 
        if and(i ~= j, adjacency_matrix(i,j)==1)
            count=count+1; 
            plot([x(i,1) x(j,1)],[y(i,1) y(j,1)])
        end
    end
end

% figure 3b - connectivity for 0.2 radius 

set(gcf,'color','w');
subplot(2,2,2)
scatter(a1,b1); % scatter plot of positions 
xlim([0 1]);
ylim([0 1]);
points = [x y];
box on
xlabel('x position', 'FontSize', 14);
text(0.89,0.1,'(B)', 'FontSize', 14)
hold on

adjacency_matrix = [];
distances_matrix = [];

for n = [1:100]
             
distances = sqrt((x-x(n,:)).^2 + (y-y(n,:)).^2);
distances1 = distances < 0.2;
distances_matrix = [distances_matrix, distances];
adjacency_matrix = [adjacency_matrix, distances1];


end

adjacency_matrix;
distances_matrix;

count=0;
for i = 1:100 
    for j = 1:100 
        if and(i ~= j, adjacency_matrix(i,j)==1)
            count=count+1; 
            plot([x(i,1) x(j,1)],[y(i,1) y(j,1)])
        end
    end
end



%figure 3c - connectivity for 0.3 coupling radius 

subplot(2,2,3)
scatter(a1,b1);
xlim([0 1]);
ylim([0 1]);
points = [x y];
xlabel('x position', 'FontSize', 14);
ylabel('y position', 'FontSize', 14);
text(0.89,0.1,'(C)', 'FontSize', 14)
box on
hold on


adjacency_matrix = [];
distances_matrix = [];

for n = [1:100]
             
distances = sqrt((x-x(n,:)).^2 + (y-y(n,:)).^2);
distances1 = distances < 0.3;
distances_matrix = [distances_matrix, distances];
adjacency_matrix = [adjacency_matrix, distances1];


end

adjacency_matrix;
distances_matrix;

count=0;
for i = 1:100 
    for j = 1:100 
        if and(i ~= j, adjacency_matrix(i,j)==1)
            count=count+1; 
            plot([x(i,1) x(j,1)],[y(i,1) y(j,1)])
        end
    end
end


% figure 3d - radius vs number of connected ffs 
% calculated neighbors using the number of non-zero adjaceny matrix 
% elements and avg the number for each ff

rad = [0 0.01 0.02 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.1 ...
    0.11 0.12 0.13 0.14 0.15 0.16 0.17 0.18 0.19 0.2 ...
    0.21 0.22 0.23 0.24 0.25 0.26 0.27 0.28 0.29 0.3 ...
    0.31 0.32 0.33 0.34 0.35 0.36 0.37 0.38 0.39 0.4 ...
    0.41 0.42 0.43 0.44 0.45 0.46 0.47 0.48 0.49 0.5];

neighbors =[0 1.06 1.24 1.4 1.5 1.86 2.2 2.58 3 3.26 3.68 ...
    4.26 4.96 5.54 6.1 6.9 7.72 8.6 9.66 10.68 11.96 ...
    12.84 14 15.04 16 17.02 18.3 19.64 20.92 22.08 23.12 ...
    24.1 25.36 26.54 27.7 28.96 30.58 31.76 33.26 34.64 36.36...
    37.8 39.34 40.78 42.36 43.96 45.18 46.42 48 49.44 50.64];

subplot(2,2,4)
plot(rad, neighbors, 'o')
xlabel('influence radius', 'FontSize',14);
ylabel('average number of neighbors', 'FontSize',14)
xlim([0, 0.51]);
ylim([0, 51]);
box on
text(0.45,5,'(D)', 'FontSize', 14)



%%%%%%%%%%%%%%%%%%% figure 4 - Signalling between model fireflies produces 
%%%%%%%%%%%%%%%%%%% regular rhythmic flashing with triangular burst events

figure(2);

% figure 4a 

subplot(6,2,1);
s1=load('s0(1).dat','-ascii'); % spiking "on/off" values 
s2=load('s0(2).dat','-ascii');

%g=0
plot(s1(:,1),s1(:,2), 'Color', 'Black') %spiking vs time
xlim([100,2000])
ylim([0,1.2])

subplot(6,2,3)

%g=0.03
plot(s2(:,1),s2(:,2), 'Color','Black')
xlim([100,2000])
ylim([0,1.2])
xlabel('time','FontSize',14)


% figure 4b - power spectrum data from XPP

subplot(3,2,2)
m2=load('fig2.dat','-ascii'); %g=0.05
m3=load('fig2b.dat','-ascii'); %g=0.03
m4=load('fig2c.dat','-ascii'); %g=0.015
m5=load('fig2d.dat','-ascii'); %g=0
hold on
plot(m2(:,1), m2(:,2), 'Color', 'red');
plot(m2(:,1), m3(:,2), 'Color', 'blue');
plot(m2(:,1), m4(:,2), 'Color', 'green');
plot(m2(:,1), m5(:,2), 'Color', 'black');
hold off
xlim([0,0.04]);
ylim([0,0.016]);
xlabel('time', 'FontSize', 14);
ylabel('power', 'FontSize', 14);
legend('g=0.05','g=0.03','g=0.015','g=0.005', 'Location', 'east')
box on


% figure 4c

subplot(3,2,3)
load('ibi1.dat', '-ascii'); % Professor Ermentrouts data
hist(ibi1(:,2))
xlabel('Interburst Interval','FontSize',14)
ylabel('Event Frequency', 'FontSize', 14)
ylim([0,310])
xlim([0,900])

% figure 4d - 100 ffs 

subplot(3,2,4)
load('ibi100.dat', '-ascii'); % Professor Ermentrouts data
hist(ibi100(:,2))
xlabel('Interburst Interval','FontSize',14)
ylim([0,310])
xlim([0,550])


% figure 4e - stot data 

uiwait(helpdlg('Updating graphics - this may take a few minutes'))
box on
set(gcf,'color','w');
subplot(3,2,5)
stot = load('fig1.dat','-ascii');
plot(stot(:,1),stot(:,2), 'Color', 'Black')
xlabel('time', 'FontSize', 14);
ylabel('fraction of fireflies flashing', 'FontSize', 14);


% figure 4f - zoomed in on above data 

subplot(3,2,6)
box on
plot(stot(:,1),stot(:,2), 'Color', 'Black')
xlabel('time', 'FontSize', 14);
xlim([480, 640]);
ylim([0,1]);




%%%%%%%%%%%%%%%%%%%%%%% figure 5 - flashes per burst, joining in synchrony 

% figure 5A/B

% 100 fireflies

m6=load('latest_test.dat','-ascii'); %loading data 

s1a = []; s2a = []; s3a = []; s4a = []; s5a = []; s6a = []; s7a = [];
s8a = []; s9a = []; s10a = []; s11a = [];A1a=[]; A2a =[]; A3a =[];
A4a =[];A5a =[];A6a =[];A7a =[]; A8a =[]; A9a =[]; A10a =[]; A11a =[];

time_period_1 = 1503; % burst time periods, manually checked
time_period_2=  6066; 
time_period_3= 9280;  
time_period_4= 12600; 
time_period_5 = 16230; 
time_period_6 = 20000; 
time_period_7 = 23170;
time_period_8 = 26490;
time_period_9 = 30250;
time_period_10 = 33340;
time_period_11 = 36450;

for n = [2:101]
    %%%% groups the flashes into bursts for each individual firefly
    idx(:)=m6(:,n)>0.2;
    offstart=strfind([0 idx 0], [0,1]);
    %b1=offstart(offstart<time_period_1);
    b2=offstart(offstart>time_period_1 & offstart<=time_period_2);
    b3=offstart(offstart>time_period_2 & offstart<=time_period_3);
    b4=offstart(offstart>time_period_3 & offstart<=time_period_4);
    %b5=offstart(offstart>time_period_4 & offstart<=time_period_5);
    b6=offstart(offstart>time_period_5 & offstart<=time_period_6);
    b7=offstart(offstart>time_period_6 & offstart<=time_period_7);
    b8=offstart(offstart>time_period_7 & offstart<=time_period_8);
    b9=offstart(offstart>time_period_8 & offstart<=time_period_9);
    b10=offstart(offstart>time_period_9 & offstart<=time_period_10);
    %b11=offstart(offstart>time_period_10 & offstart<=time_period_11); 
    
    %%%% finds start times for each burst 
    %s1 = b1(1,1); 
    s2 = b2(1,1); 
    s3 = b3(1,1); 
    s4 = b4(1,1); 
    %s5 = b5(1,1);
    s6 = b6(1,1); 
    s7 = b7(1,1); 
    s8 = b8(1,1); 
    %s9 = b9(1,1); 
    s10 = b10(1,1);
    %s11 = b11(1,1);
    
    %%%% creates a vector with each firefly's start time 
    %s1a = [s1a, s1];
    s2a = [s2a, s2];
    s3a = [s3a, s3];
    s4a = [s4a, s4];
    %s5a = [s5a, s5]; 
    s6a = [s6a, s6]; 
    s7a = [s7a, s7]; 
    s8a = [s8a, s8];
    %s9a = [s9a, s9]; 
    s10a = [s10a, s10]; 
    %s11a = [s11a, s11];
    
    %%%% number of flashes per burst 
    %A1=numel(b1); 
    A2=numel(b2); 
    A3=numel(b3); 
    A4=numel(b4); 
    %A5=numel(b5); 
    A6=numel(b6); 
    A7=numel(b7); 
    A8=numel(b8); 
    %A9=numel(b9); 
    A10=numel(b10); 
    %A11=numel(b11); 
    
    %%%% creates a vector with each firefly's flash number
    %A1a = [A1a, A1]; 
    A2a = [A2a, A2]; 
    A3a = [A3a, A3]; 
    A4a = [A4a, A4]; 
    %A5a = [A5a, A5];
    A6a = [A6a, A6]; 
    A7a = [A7a, A7]; 
    A8a = [A8a, A8];
    %A9a = [A9a, A9]; 
    A10a = [A10a, A10]; 
    %A11a = [A11a, A11]; 
    
    %%%% groups start time to number of flashes 
    %x1 = [s1a', A1a'];
    x2 = [s2a', A2a'];
    x3 = [s3a', A3a'];
    x4 = [s4a', A4a'];
    %x5 = [s5a', A5a'];
    x6 = [s6a', A6a'];
    x7 = [s7a', A7a'];
    x8 = [s8a', A8a'];
    %x9 = [s9a', A9a'];
    x10 = [s10a', A10a'];
    %x11 = [s11a', A11a'];

end 


%%%% sorts them to be ordered by onset of flash
%x1a = sortrows(x1, 1);
x2a = sortrows(x2, 1);
x3a = sortrows(x3, 1);
x4a = sortrows(x4, 1);
%x5a = sortrows(x5, 1);
x6a = sortrows(x6, 1);
x7a = sortrows(x7, 1);
x8a = sortrows(x8, 1);
%x9a = sortrows(x9, 1);
x10a = sortrows(x10, 1);
%x11a = sortrows(x11, 1);

%%%% create an avg number of flashes for each onset position and change

y1=[];
for n = [1:100] 
    y = [x2a(n,:); x3a(n,:); x4a(n,:); x6a(n,:); x7a(n,:); ...
        x8a(n,:); x10a(n,:)];
    y1=[y1;y];
    
end

c1 = [1:100]';
c2 = [mean(reshape(y1(:,2),  7, []))]'; 
c3 = [c1, c2];

figure(3);
set(gcf,'color','w');
subplot(2,2,1)
plot(c3(:,1), c3(:,2), 'o')
xlabel('flashing onset position', 'FontSize', 14);
ylabel('flashes in a burst', 'FontSize', 14);
xlim([-0.5,100.5])
ylim([4,10.5])
box on
text(85,10,'(A)', 'FontSize', 14)


%%%% average number of flashes per burst
H = [A2a A3a A4a A5a A6a A7a A8a A9a A10a];
subplot(2,2,2)
histogram(H)
xlabel('number of flashes', 'FontSize', 14);
ylabel('event frequency', 'FontSize', 14);
box on
text(11,275,'(B)', 'FontSize', 14)


% figure 5 C/D

% s0-s99 is when each is flashing (above the threshold)
% t(1), u(2:101), v(102:201), lam(202:301), x(302:401), 
% y(402:501), theta(502:601), s(602:701), stot(702) c(703:802)


% cut the data so we only take one burst: 2684-5716 (MatLab times)
m7 = m6(2684:5620, :);

table1=[];first_table1=[];

% if you change the size change here: add one to end for however many
for n =[2:21]
    u1 = m7(:,n);
    idx1(:)=u1>0.2;
    offstart=strfind([0 idx1 0], [0,1]); 
    k = numel(offstart);
    i = repelem(n,k);
    table = [offstart' i'];
    table1 = [table1;table];
    first=offstart(1);
    first_table=[offstart(1) n];
    first_table1 = [first_table1;first_table];
end


first_table2 = sortrows(first_table1, 1);
index_order = first_table2(:,2)';
[found, idx] = ismember(table1, [index_order]);
[~, sort_order] = sort(idx);
A2 = table1(sort_order, :);%has them in the right order but still with indices
r1 = size(A2);
r2 = size(A2)/2;
x = r2(1,1)+1;
A3=A2(x:r1(1,1),:);

% also have to change here
p2 = [1:20];
pairs = [index_order' p2'];

% and here
for n = [1:20]
    pair1=pairs(n,1);
    pair2=pairs(n,2);
    row(A3(:,2)==pair1)=pair2;
end

row;

line_values= [246 357 481 608 738 869 999 1128 1259 1392 1531];        
lines=mean([line_values(1:end-1);line_values(2:end)]);
vline=lines(7:10);


% figure 5C

set(gcf,'color','w');
subplot(2,2,3)
hold on
box on
plot(A3(:,1), row, 'o','MarkerSize', 5)
xline(vline(1),'LineWidth',1.2 );
xline(vline(2),'LineWidth',1.2);
xline(vline(3),'LineWidth',1.2);
xline(vline(4),'LineWidth',1.2);
xline(vline(4)+mean(diff(vline)),'LineWidth',1.2);
ylim([0,21])
xlabel('flash time', 'FontSize', 14)
ylabel('firefly index', 'FontSize', 14)
text(2600,19, '(C)', 'FontSize', 14)


% figure 5D

table1a=[];first_table1a=[];

for n =[2:101]
    u1a = m7(:,n);
    idx1a(:)=u1a>0.2;
    offstarta=strfind([0 idx1a 0], [0,1]); 
    k2 = numel(offstarta);
    i2 = repelem(n,k2);
    tablea = [offstarta' i2'];
    table1a = [table1a;tablea];
    firsta=offstarta(1);
    first_tablea=[offstarta(1) n];
    first_table1a = [first_table1a;first_tablea];
end


first_table2a = sortrows(first_table1a, 1);
index_ordera = first_table2a(:,2)';
[founda, idxa] = ismember(table1a, [index_ordera]);
[~, sort_ordera] = sort(idxa);
A2a = table1a(sort_ordera, :); %has them in the right order but still with indices
A3a=A2a(566:1130,:);


p2a = [1:100];
pairsa = [index_ordera' p2a'];

for n = [1:100]
    pair1a=pairsa(n,1);
    pair2a=pairsa(n,2);
    rowa(A3a(:,2)==pair1a)=pair2a;
end

row;
subplot(2,2,4)
box on
hold on
plot(A3a(:,1), rowa, 'o', 'MarkerSize', 5)
ylim([0,101])
xlabel('flash time', 'FontSize', 14)
text(2600,90, '(D)', 'FontSize', 14)







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% figure 6 by Professor Ermentrout 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% figure 7 spatiotemporal profile

m9=load('latest_test.dat','-ascii');

%%%% 7A - Bursts 
%%%% plots the time between a flash of ff1 and the rest of the fireflies'
%%%% all subsequent flashes vs the distance away from firefly 10 

a1=[];b1=[];

%%%% import the x and y positions 
for n = 302:401
    a = [m9(1,n)];
    a1 = [a1,a];
end

d1=a1';

for n = 402:501
    b = [m9(1,n)];
    b1 =[b1,b];
end

d2=b1';

px=d1(1,1);
py=d2(1,1);


%%%% start with v1 (point 1) then mark the relative time 
%%%% and distance of the flashing of the others 

u1 = m9(:,2);
idx1(:)=u1>0.2;
offstart1=strfind([0 idx1 0], [0,1]);
offstart2=offstart1(offstart1>680);
offend1=strfind([0 idx1 0], [1,0])-1;

next_flash1 = [];
timedif1 = [];


%%%% goes through first i flashes for v1 
%%%% use 5 for bursts 
for i = 1:5

    next_flash=offstart2(i);
     

skipNum = [2] %for wave
for n = 2:101
    
    if ~ismember(n, skipNum)
    
    v=m9(:,n);
    idx(:)=v>0.2;
    offstart=strfind([0 idx 0], [0,1]); 
    vflash = find(offstart> next_flash); 
    time = offstart(vflash);
    len = length(vflash);
    timedif = (time- next_flash*ones(1,len));   
    p1a = d1((n-1),1);
    p1b = d2((n-1),1);
    sig = sqrt((px-p1a).^2 + (py-p1b).^2);
    timedif1=[timedif1; timedif' sig*ones(len,1)]; 
    end
        
end

end

figure(4);
hold on
subplot(2,2,2)
plot(timedif1(:,1),timedif1(:,2),'.')
xlim([3500,18000])
text(0.9,1.6,'(B)', 'FontSize', 14)
ylim([0,1])
box on
xlabel('time since flash of firefly 1', 'FontSize',14);


h=sortrows(timedif1,1);
l=h(1:35, 1:2);

subplot(2,2,1)
hist3(timedif1, [20 10])
xlabel('Time Since flash of Firefly 1', 'FontSize',14);
ylabel('Distance from Firefly 1', 'FontSize', 14);
text(0.9,1.6,'(A)', 'FontSize', 14)

N = hist3(timedif1, [20 10]);
N_pcolor = N';
N_pcolor(size(N_pcolor,1)+1,size(N_pcolor,2)+1) = 0;
xl = linspace(min(timedif1(:,1)),max(timedif1(:,1)),size(N_pcolor,2)); 
yl = linspace(min(timedif1(:,2)),max(timedif1(:,2)),size(N_pcolor,1));
h = pcolor(xl,yl,N_pcolor);
colormap(jet)
shading interp;
colorbar
h.ZData = -max(N_pcolor(:))*ones(size(N_pcolor));
ax = gca;
ax.ZTick(ax.ZTick < 0) = [];
xlabel('time since flash of firefly 1', 'FontSize',14);
ylabel('distance from firefly 1', 'FontSize',14);
xlim([3500,18000])
ylim([0,1])
caxis([0,350])
box on


%%%% fig 7B - spikes 
%%%% plots the time between a flash ff1 and the rest of the fireflies'
%%%% next N flashes vs the distance away from firefly 10 (user selects N
%%%% with variable fwd below)

a1=[];b1=[];

%%%% import the x and y positions 
for n = 302:401
    a = [m9(1,n)];
    a1 = [a1,a];
end

d1=a1';

for n = 402:501
    b = [m9(1,n)];
    b1 =[b1,b];
end

d2=b1';


px=d1(1,1);
py=d2(1,1);

%%%% start with v1 (point 1) then mark the relative time 
%%%% and distance of the flashing of the others 

%v1 = m(:,111);
%u1 = m(:, 76);
u1=m9(:,2);
idx1(:)=u1>0.2;
offstart1=strfind([0 idx1 0], [0,1]);
offstart2=offstart1(offstart1>956);
%offstart2=offstart1(offstart1>10500);
offend1=strfind([0 idx1 0], [1,0])-1;

next_flash1 = [];
timedif1 = [];

fwd=5;

nf1=[];
%%%% goes through first 5 flashes because 5 in this burst for ff 76
for i = 1:5
    next_flash=offstart2(i);
    nf1=[nf1, next_flash];
    
    
%skip 76 at 956
skipNum = [76]; 
for n = 2:101 
    if ~ismember(n, skipNum)
    v=m9(:,n); 
    idx(:)=v>0.2;
    offstart=strfind([0 idx 0], [0,1]); 
    vflash = find(offstart> next_flash); 
    if length(vflash)>=fwd
        vflash=vflash(1,1:fwd);
        time = offstart(vflash);
        timedif = (time- next_flash*ones(1,fwd));   
        p1a = d1((n-1),1);
        p1b = d2((n-1),1);
        sig = sqrt((px-p1a).^2 + (py-p1b).^2);
        timedif1=[timedif1; timedif' sig*ones(fwd,1)];  
    end
    end
        
end

end

%figure(2);
%%%% makes it only plot the first flash after the burst so here we can have
%%%% spike histogram

subplot(2,2,4)
k1 = [timedif1(:,1),timedif1(:,2)];
k = k1((timedif1(:,1) < 600),:);
plot(k(:,1),k(:,2),'.')
xlabel('time since flash of firefly 1', 'FontSize', 14);



subplot(2,2,3)
hist3(k, [20 20])
N = hist3(k,[12,4]);
N_pcolor = N';
N_pcolor(size(N_pcolor,1)+1,size(N_pcolor,2)+1) = 0;
xl = linspace(min(k(:,1)),max(k(:,1)),size(N_pcolor,2)); 
yl = linspace(min(k(:,2)),max(k(:,2)),size(N_pcolor,1));
h = pcolor(xl,yl,N_pcolor);
colormap(jet)
shading interp;
colorbar
caxis([0,50])
h.ZData = -max(N_pcolor(:))*ones(size(N_pcolor));
ax = gca;
ax.ZTick(ax.ZTick < 0) = [];
xlabel('time since flash of firefly 1', 'FontSize', 14);
ylabel('distance from firefly 1', 'FontSize', 14);
xlim([0,400])
ylim([0,1])
hold off






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% figure 8 wave 

estart =[]; xp1=[]; yp1=[]; e1=[];

m8=load('latest_wave.dat','-ascii');

a1=[];b1=[];

%%%% import the x and y positions 
for n = 302:401
    a = [m8(1,n)];
    a1 = [a1,a];
end

for n = 402:501
    b = [m8(1,n)];
    b1 =[b1,b];
end

%%%% wave is relative to 2 
t = m8(:,1);
vstart = m8(:,77); 
XPPff79 = [t,vstart];
idx(:)=vstart>0.2;
start=strfind([0 idx 0], [0,1]);
vstart2 = vstart(start);
s = size(vstart2);
%%%% MatLab table
MTstart = [start', vstart2];

%%%% finds flash times in XPPT table and records the first one past the start time
% use 946 as time for ff 76 for a wave
for i = 1:s
        q = vstart2(i);
        e = XPPff79(find(vstart==q));
        
        if e > 946 %(ff 76) 
            estart = [estart,e];
            break
        end
    
      
end
    
%%%% goes through the other fireflies records their positions and startimes
%%%% in XPP time that are greater than the start time of ff 79

skipNum = [76] 
for n = 1:100
    if ~ismember(n, skipNum)
    
    xp = a1(1,n);
    yp = b1(1,n);
    xp1 = [xp1, xp];
    yp1=[yp1,yp];
   
%%%% create a table with the XPP times and voltages 
    format longG
    t = m8(:,1);
    v1 = m8(:,n+1);
    XPPT = [t,v1];
    
%%%% find the times v1 crosses x-axis with MatLab times
    format longG
    idx(:)=v1>0.2;
    offstart=strfind([0 idx 0], [0,1]);
    v2 = v1(offstart);
    s = size(v2);
    %%%% MatLab table
    MT = [offstart', v2];
    %%%% find the values of v2 in the XPP table (ie, the real flash times)
    
    for i = 1:s
        q = v2(i);
        e = XPPT(find(v1==q));
        
        if e > estart  
            e1 = [e1,e];
            break
        end
    
      
    end
   
    end
 
   
    
end

%%%% finds relative time 

e2 = e1 - estart;

%%%% adds firefly back to the matrix 
flashtimes = [xp1' yp1' e2'];
A1 = [a1(1,76) ; xp1']; % for spiral
B1 = [b1(1,76); yp1']; % for spiral
C1 = [0;e2'];

figure(5);  
set(gcf,'color','w');
ax(2)=subplot(1,2,2)
scatter(A1,B1,80, C1,'filled');
colormap(ax(2),hsv(n)); colorbar();
ylim([0,1])
box on
xlabel('x position', 'FontSize', 14);
caxis([0 3])

X = A1;
Y = B1;
Z = C1;
xv = linspace(min(X), max(X));
yv = linspace(min(Y), max(Y));
[Xm,Ym] = ndgrid(xv, yv);
Zm = griddata(X, Y, Z, Xm, Ym);

ax(1)=subplot(1,2,1)
contourf(Xm, Ym, Zm, 50, 'linestyle', 'none')
colormap(ax(1),hsv)
colorbar
caxis([0 3]) 
xlabel('x position', 'FontSize', 14);
ylabel('y position', 'FontSize',14);
ylim([0,1])

