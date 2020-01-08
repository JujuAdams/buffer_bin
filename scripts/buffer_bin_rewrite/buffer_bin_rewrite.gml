/// @param filename
/// @param [callback]

var _filename = argument[0];
var _callback = (argument_count > 1)? argument[1] : undefined;

var _array = array_create(BUFFER_BIN.__SIZE);
_array[BUFFER_BIN.FILENAME] = _filename;
_array[BUFFER_BIN.BUFFER  ] = -1;
_array[BUFFER_BIN.MODE    ] = BUFFER_BIN_MODE.WRITE;
_array[BUFFER_BIN.REWRITE ] = true;
_array[BUFFER_BIN.PENDING ] = global.__buffer_bin_async;
_array[BUFFER_BIN.FAILED  ] = false;
_array[BUFFER_BIN.CLOSED  ] = false;
_array[BUFFER_BIN.CALLBACK] = _callback;

if (global.__buffer_bin_async)
{
    var _buffer = buffer_create(BUFFER_BIN_DEFAULT_SIZE, buffer_grow, 1);
    var _async_handle = buffer_load_async(_buffer, _filename, 0, BUFFER_BIN_MAX_SIZE);
    global.__buffer_bin_async_map[? _async_handle] = _array;
}
else
{
    if (file_exists(_filename))
    {
        var _source_buffer = buffer_load(_filename);
        var _buffer = buffer_create(buffer_get_size(_source_buffer), buffer_grow, 1);
        buffer_delete(_source_buffer);
    }
    else
    {
        var _buffer = buffer_create(BUFFER_BIN_DEFAULT_SIZE, buffer_grow, 1);
    }
}

_array[@ BUFFER_BIN.BUFFER] = _buffer;

if (!global.__buffer_bin_async)
{
    var _callback = _array[@ BUFFER_BIN.CALLBACK];
    if ((_callback != undefined) && script_exists(_callback)) script_execute(_callback, _array);
}

return _array;