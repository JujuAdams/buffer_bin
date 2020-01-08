/// @param fileHandle
/// @param position

var _file_handle = argument0;
var _position    = argument1;

if (_file_handle[BUFFER_BIN.PENDING])
{
    show_debug_message("buffer_bin: Error! Async event for \"" + string(_file_handle[BUFFER_BIN.FILENAME]) + "\" has not completed");
    exit;
}

if (_file_handle[BUFFER_BIN.FAILED])
{
    show_debug_message("buffer_bin: Error! File I/O for " + string(_file_handle[BUFFER_BIN.FILENAME]) + " failed");
    exit;
}

if (_file_handle[BUFFER_BIN.CLOSED])
{
    show_debug_message("buffer_bin: Error! File handle for " + string(_file_handle[BUFFER_BIN.FILENAME]) + " has been closed");
    exit;
}

var _buffer = _file_handle[BUFFER_BIN.BUFFER];

buffer_seek(_buffer, buffer_seek_start, _position);