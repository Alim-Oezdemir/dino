namespace ICU {

[CCode (cname = "UChar")]
[IntegerType (rank = 5, min = 0, max = 65535)]
struct Char {}

[CCode (cname = "UErrorCode", cprefix = "U_", cheader_filename = "unicode/utypes.h")]
enum ErrorCode {
    ZERO_ERROR,
    INVALID_CHAR_FOUND,
    INDEX_OUTOFBOUNDS_ERROR,
    BUFFER_OVERFLOW_ERROR,
    UNASSIGNED_CODE_POINT_FOUND,
    IDNA_STD3_ASCII_RULES_ERROR
    ;
    [CCode (cname = "u_errorName")]
    public unowned string errorName();
}

[CCode (cname = "UErrorCode", cprefix = "U_", cheader_filename = "unicode/parseerr.h")]
struct ParseError {}

[CCode (cname = "UStringPrepProfile", cprefix = "usprep_", free_function = "usprep_close", cheader_filename = "unicode/usprep.h")]
[Compact]
class PrepProfile {
    public static PrepProfile open(string path, string file_name, ref ErrorCode status);
    public static PrepProfile openByType(PrepType type, ref ErrorCode status);
    public int32 prepare(Char* src, int32 src_length, Char* dest, int32 dest_capacity, PrepOptions options, out ParseError parse_error, ref ErrorCode status);
}
[CCode (cname = "UStringPrepProfileType", cprefix = "USPREP_")]
enum PrepType {
    RFC3491_NAMEPREP,
    RFC3920_NODEPREP,
    RFC3920_RESOURCEPREP
}
[CCode (cname = "int32_t", cprefix = "USPREP_")]
enum PrepOptions {
    DEFAULT,
    ALLOW_UNASSIGNED
}

[CCode (cname = "UIDNA", cprefix = "uidna_", free_function = "uidna_close", cheader_filename = "unicode/uidna.h")]
[Compact]
class IDNA {
    public static int32 IDNToUnicode(Char* src, int32 src_length, Char* dest, int32 dest_capacity, IDNAOptions options, out ParseError parse_error, ref ErrorCode status);
    public static int32 IDNToASCII(Char* src, int32 src_length, Char* dest, int32 dest_capacity, IDNAOptions options, out ParseError parse_error, ref ErrorCode status);
}

[CCode (cname = "uint32_t", cprefix = "UIDNA_")]
enum IDNAOptions {
    DEFAULT,
    ALLOW_UNASSIGNED,
    USE_STD3_RULES
}

}