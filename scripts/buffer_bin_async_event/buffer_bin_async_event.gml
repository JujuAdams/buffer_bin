var _error  = async_load[? "error" ];
var _status = async_load[? "status"];
var _id     = async_load[? "id"    ];

var _file_handle = global.__buffer_bin_async_map[? _id];
if (is_array(_file_handle))
{
    _file_handle[@ BUFFER_BIN.PENDING] = false;
    
    if ((_error < 0) || !_status)
    {
        show_debug_message("buffer_bin: Error! File async failed for \"" + string(_file_handle[BUFFER_BIN.FILENAME]) + "\"");
        
        var _buffer = _file_handle[@ BUFFER_BIN.BUFFER];
        if (_buffer >= 0)
        {
            buffer_delete(_buffer);
            _file_handle[@ BUFFER_BIN.BUFFER] = -1;
        }
        
        _file_handle[@ BUFFER_BIN.FAILED] = true;
    }
    else
    {
        //If we loaded this file in to be rewritten, create a new buffer exactly the same size and delete the old buffer
        if (_file_handle[@ BUFFER_BIN.REWRITE])
        {
            var _buffer = _file_handle[@ BUFFER_BIN.BUFFER];
            if (_buffer > 0)
            {
                _file_handle[@ BUFFER_BIN.BUFFER] = buffer_create(buffer_get_size(_buffer), buffer_grow, 1);
                buffer_delete(_buffer);
            }
        }
    }
    
    var _callback = _file_handle[@ BUFFER_BIN.CALLBACK];
    if ((_callback != undefined) && script_exists(_callback)) script_execute(_callback, _file_handle);
}