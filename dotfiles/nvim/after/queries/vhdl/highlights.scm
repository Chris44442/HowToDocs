[
  "alias" "package" "file" "entity" "architecture" "type" "subtype"
  "attribute" "to" "downto" "signal" "variable" "record" "array"
  "others" "process" "component" "shared" "constant" "port" "generic"
  "generate" "range" "map" "in" "inout" "of" "out" "configuration"
  "pure" "impure" "is" "begin" "end" "context" "wait" "until" "after"
  "report" "open" "exit" "assert" "next" "null" "force" "property"
  "release" "sequence" "transport" "unaffected" "select" "severity"
  "register" "reject" "postponed" "on" "new" "literal" "linkage"
  "inertial" "guarded" "group" "disconnect" "bus" "buffer" "body"
  "all" "block" "access"
] @keyword

[
  "function" "procedure"
] @keyword.function

[
  "return"
] @keyword.return

[
  "for" "loop" "while"
] @keyword.repeat

[ 
  "if" "elsif" "else" "case" "then" "when"
] @keyword.conditional

[ 
  "library" "use"
] @keyword.include

(comment) @comment @spell

(type_mark) @type

[
  "(" ")" "[" "]"
] @punctuation.bracket

[
  "." ";" "," ":"
] @punctuation.delimeter

[
  "=>" "<=" "+" ":=" "=" "/=" "<" ">" "-" "*"
  "**" "/" "?>" "?<" "?<=" "?>=" "?=" "?/="
; "?/" errors, maybe due to escape character
  (attribute_name "'")
  (index_subtype_definition (any))
] @operator

[
  "not" "xor" "xnor" "and" "nand" "or" "nor" "mod" "rem"
  (attribute_name "'")
  (index_subtype_definition (any))
] @keyword.operator

[
  (real_decimal)
  (integer_decimal)
] @number

(character_literal) @character

[
  (string_literal)
  (bit_string_literal)
] @string

(physical_literal
  unit: (simple_name) @attribute)

(attribute_name
  prefix: (_) @variable
  designator: (_) @attribute)

((simple_name) @variable.builtin (#any-of? @variable.builtin
  "true" "false" "now"))

(severity_expression) @constant.builtin

(procedure_call_statement) @function

(ambiguous_name
  prefix: (simple_name) @function.builtin (#any-of? @function.builtin
    "rising_edge" "falling_edge" "find_rightmost" "find_leftmost"
    "maximum" "minimum" "shift_left" "shift_right" "rotate_left"
    "rotate_right" "sll" "srl" "rol" "ror" "sla" "sra" "resize"
    "mod" "rem" "abs" "saturate"
; convert
    "to_sfixed" "to_ufixed" "to_signed" "to_unsigned" "to_real"
    "to_integer" "sfixed_low" "ufixed_low" "sfixed_high"
    "ufixed_high" "to_slv" "to_stdulogicvector" "to_sulv"
    "to_float" "std_logic" "std_logic_vector" "integer" "signed"
    "unsigned" "real" "std_ulogic_vector"
; text
    "read" "write" "hread" "hwrite" "to_hstring" "to_string"
    "from_hstring" "from_string"
; math_real
    "sign" "ceil" "floor" "round" "fmax" "fmin" "uniform" "srand"
    "rand" "get_rand_max" "sqrt" "cbrt" "exp" "log" "log2" "log10"
    "sin" "cos" "tan" "asin" "acos" "atan" "atan2" "sinh" "cosh"
    "tanh" "asinh" "acosh" "atanh" "realmax" "realmin" "trunc"
    "conj" "arg" "polar_to_complex" "complex_to_polar"
    "get_principal_value" "cmplx"
))

