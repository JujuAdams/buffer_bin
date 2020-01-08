/// @param fileHandle

var _file_handle = argument0;

show_debug_message("Opening file for reading ");

buffer_bin_open("file.bin", 0, example_callback_read);