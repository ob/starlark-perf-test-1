def _append_rule_impl(ctx):
    paths = []
    for p in range(ctx.attr.paths):
        path = ["path_%d" % p]
        for c in range(ctx.attr.components):
            path.append("%d" % c)
        paths.append("/".join(path))
    ctx.actions.write(
        output = ctx.outputs.out,
        content = "\n".join(paths),
    )
    return DefaultInfo(files = depset([ctx.outputs.out]))

append_rule = rule(
    implementation = _append_rule_impl,
    attrs = {
        "paths": attr.int(),
        "components": attr.int(),
    },
    outputs = {
        "out": "%{name}.txt",
    },
)

def _plus_equal_rule(ctx):
    paths = []
    for p in range(ctx.attr.paths):
        path = ["path_%d" % p]
        for c in range(ctx.attr.components):
            path += ["%d" % c]
        paths += ["/".join(path)]
    ctx.actions.write(
        output = ctx.outputs.out,
        content = "\n".join(paths),
    )
    return DefaultInfo(files = depset([ctx.outputs.out]))

plus_equal_rule = rule(
    implementation = _plus_equal_rule,
    attrs = {
        "paths": attr.int(),
        "components": attr.int(),
    },
    outputs = {
        "out": "%{name}.txt",
    },
)
