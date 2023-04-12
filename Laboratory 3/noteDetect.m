function [maxNote,maxNoteFreq] = noteDetect(x,fs)

    % Define note frequencies for all 12 notes in an octave
    NOTES = [440 440*2.^((1:12)/12)];
    notesFreq = NOTES*2*pi/fs;

    % Initialize variables
    maxFilter = 0;
    maxNote = 0;
    maxNoteFreq = 0;

    % Iterate through each note frequency and filter the input signal
    for i = 1:12
        theta = notesFreq(i);
        b = 1;
        a = conv([1 -0.98*exp(j*theta)],[1 -0.98*exp(j*-theta)]);
        y = filter(b,a,x);
        
        % Update maxNote and maxNoteFreq if the filtered signal has a greater sum of absolute values
        if sum(abs(y)) > maxFilter
            maxFilter = sum(abs(y));
            maxNote = i;
            maxNoteFreq = NOTES(i);
        end
    end
end
