/// @param fileHandle

var _file_handle = argument0;

if (_file_handle[BUFFER_BIN.PENDING])
{
    show_debug_message("buffer_bin: Error! Async event for \"" + string(_file_handle[BUFFER_BIN.FILENAME]) + "\" has not completed");
    return undefined;
}

if (_file_handle[BUFFER_BIN.FAILED])
{
    show_debug_message("buffer_bin: Error! File I/O for " + string(_file_handle[BUFFER_BIN.FILENAME]) + " failed");
    return undefined;
}

if (_file_handle[BUFFER_BIN.CLOSED])
{
    show_debug_message("buffer_bin: Error! File handle for " + string(_file_handle[BUFFER_BIN.FILENAME]) + " has been closed");
    return undefined;
}

return buffer_tell(_file_handle[BUFFER_BIN.BUFFER]);