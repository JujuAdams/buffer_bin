/// @param fileHandle

var _file_handle = argument0;

show_debug_message("Reading");
show_debug_message(buffer_bin_read_byte(_file_handle));
show_debug_message(buffer_bin_read_byte(_file_handle));
show_debug_message(buffer_bin_read_byte(_file_handle));

show_debug_message("Closing file");
buffer_bin_close(_file_handle);