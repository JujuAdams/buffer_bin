buffer_bin_init(false);

var _file = file_bin_open("file.bin", 1);
file_bin_write_byte(_file, 42);
file_bin_write_byte(_file, 123);
file_bin_write_byte(_file, 255);
file_bin_close(_file);

show_debug_message("Opening file for writing");
var _file = buffer_bin_open("buffer.bin", 1, example_callback_write);