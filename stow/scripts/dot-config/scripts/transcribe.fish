set pid_file /tmp/transcribe.pid
set recording_file /tmp/transcribe.wav
set whisper_model_file ~/.local/share/gguf/whisper-ggml-base.en.bin

function notify --argument-names message
    if command -q terminal-notifier
        terminal-notifier -message $message
    end
end

function record
    ffmpeg \
        -f avfoundation \
        -i ":0" \
        -ar 16000 \
        -ac 1 \
        -nostdin \
        $recording_file &>/dev/null &

    echo $last_pid >$pid_file
    notify 'recording started'
end

function transcribe
    whisper-cli \
        -f $recording_file \
        -m $whisper_model_file \
        --no-timestamps 2>/dev/null \
        | kak -f 's^[\n ]<ret>d' \
        | copy

    rm -f $recording_file
    notify 'transcription finished'
end

function is_recording
    return (test -f $pid_file && kill -0 (cat $pid_file) &>/dev/null)
end

function kill_recording
    kill (cat $pid_file)
    wait (cat $pid_file) &>/dev/null
    rm -f $pid_file
end

if is_recording
    kill_recording
    transcribe
else
    record
end
