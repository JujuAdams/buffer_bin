/// @param fileHandle
/// @param value

var _file_handle = argument0;
var _value       = argument1;

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

if (_file_handle[BUFFER_BIN.MODE] == BUFFER_BIN_MODE.READ)
{
    show_debug_message("buffer_bin: Error! Cannot write to " + string(_file_handle[BUFFER_BIN.FILENAME]) + " (opened for reading)");
    return undefined;
}

buffer_write(_file_handle[BUFFER_BIN.BUFFER], buffer_u8, _value);