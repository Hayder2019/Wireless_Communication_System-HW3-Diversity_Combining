sample_num = 20000;
gI = normrnd(0,sqrt(var(i)),1,sample_num);

enr_dB = 1;
enr = 10^(enr_dB/10)

% generate QPSK data
data = rand(2,sample_num); 
data = 2*(data > 0.5)-1;

Edata = sqrt(2); % symbol energy
En = Edata/enr; % noise energy

% generate noise
ni = normrnd(0,sqrt(En/2),2,sample_num);
nq = normrnd(0,sqrt(En/2),2,sample_num);
n = ni + 1i*nq;

% generate fading gain
gi = normrnd(0,1,1,sample_num);
gq = normrnd(0,1,1,sample_num);
g = gi + 1i*gq;
g = repmat(g,2,1);

% received signal
r = g.*data + n;