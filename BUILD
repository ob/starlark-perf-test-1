load("//rules:rules.bzl", "append_rule", "plus_equal_rule")

paths = 1000
components = 10000

append_rule(
    name = "append_rule",
    paths = paths,
    components = components,
)

plus_equal_rule(
    name = "plus_equal_rule",
    paths = paths,
    components = components,
)

genrule(
    name = "combined",
    srcs = [
        ":append_rule",
        ":plus_equal_rule",
    ],
    cmd_bash = """
        echo append_rule >> $@
        cat $(location :append_rule) >> $@
        echo >> $@
        echo plus_equal_rule >> $@
        cat $(location :plus_equal_rule) >> $@
    """,
    outs = ["combined.out"],

)
