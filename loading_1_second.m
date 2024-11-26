% Step 1: Load the .mat file
data = load('power_data_1_hour.mat');  % Replace with your actual file name

% Step 2: Access the allData variable
amplitudes = data.allData;  % Replace 'allData' with the actual variable name

% Step 3: Access the first second of data (250,000 samples)
first_second_data = amplitudes(251000:500000);

% Step 4: Perform FFT on the data
Fs = 250000;  % Sampling rate in Hz (250 kS/s)
N = length(first_second_data);  % Number of samples
Y = fft(first_second_data);     % Perform the FFT

% Step 5: Compute the one-sided amplitude spectrum
P2 = abs(Y / N);                % Two-sided spectrum
P1 = P2(1:N/2+1);               % One-sided spectrum
P1(2:end-1) = 2 * P1(2:end-1);  % Adjust amplitude for one-sided spectrum

% Step 6: Generate the frequency axis
f = Fs * (0:(N/2)) / N;         % Frequency vector (in Hz)

% Step 7: Plot the amplitude spectrum
figure;
plot(f, P1);
title('Single-Sided Amplitude Spectrum');
xlabel('Frequency (Hz)');
ylabel('|P1(f)|');
grid on;