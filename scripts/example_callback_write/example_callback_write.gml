/// @param fileHandle

var _file_handle = argument0;

show_debug_message("Writing");
buffer_bin_write_byte(_file_handle, 42);
buffer_bin_write_byte(_file_handle, 123);
buffer_bin_write_byte(_file_handle, 255);

show_debug_message("Saving file");
buffer_bin_close(_file_handle, example_callback_write_close);