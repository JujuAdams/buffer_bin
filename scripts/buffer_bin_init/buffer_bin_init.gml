/// buffer_bin v1.0.0
/// 2020/01/06
/// @jujuadams
///
/// @param [useAsync]

global.__buffer_bin_async = ((argument_count > 0) && (argument[0] != undefined))? argument[0] : false;

global.__buffer_bin_async_map = ds_map_create();

enum BUFFER_BIN
{
    FILENAME,
    BUFFER,
    MODE,
    REWRITE,
    PENDING,
    FAILED,
    CLOSED,
    CALLBACK,
    __SIZE
}

enum BUFFER_BIN_MODE
{
    READ,
    WRITE,
    RANDOM
}

#macro __BUFFER_BIN_VERSION  "1.0.0"
#macro __BUFFER_BIN_DATE     "2020/01/08"