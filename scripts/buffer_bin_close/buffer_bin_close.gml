/// @param fileHandle
/// @param [callback]

var _file_handle = argument[0];
var _callback    = (argument_count > 1)? argument[1] : undefined;

if (_file_handle[BUFFER_BIN.PENDING])
{
    show_debug_message("buffer_bin: Error! Async event for \"" + string(_filename) + "\" has not completed");
    exit;
}

if (_file_handle[BUFFER_BIN.FAILED])
{
    show_debug_message("buffer_bin: Error! File I/O for " + string(_file_handle[BUFFER_BIN.FILENAME]) + " failed");
    exit;
}

if (_file_handle[BUFFER_BIN.CLOSED])
{
    show_debug_message("buffer_bin: Error! File handle for \"" + string(_filename) + "\" has already been closed");
    exit;
}

var _filename = _file_handle[BUFFER_BIN.FILENAME];
var _buffer   = _file_handle[BUFFER_BIN.BUFFER  ];
_file_handle[@ BUFFER_BIN.CALLBACK] = _callback;

if (global.__buffer_bin_async)
{
    _file_handle[BUFFER_BIN.PENDING] = true;
    
    var _async_handle = buffer_save_async(_buffer, _filename, 0, buffer_tell(_buffer));
    global.__buffer_bin_async_map[? _async_handle] = _file_handle;
}
else
{
    buffer_save(_buffer, _filename);
}

buffer_delete(_buffer);
_file_handle[@ BUFFER_BIN.BUFFER] = -1;
_file_handle[@ BUFFER_BIN.CLOSED] = true;

if (!global.__buffer_bin_async)
{
    var _callback = _file_handle[@ BUFFER_BIN.CALLBACK];
    if ((_callback != undefined) && script_exists(_callback)) script_execute(_callback, _file_handle);
}