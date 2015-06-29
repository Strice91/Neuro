function [ signal,fs ] = read_audio_mono( filename )

[signal,fs] = audioread(filename);

if size(signal,2) > 1
    signal = signal(:,1);
end


end

